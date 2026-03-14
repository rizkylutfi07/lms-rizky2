"use client";

import dynamic from 'next/dynamic';
import 'react-quill-new/dist/quill.snow.css';
import { useRef, useMemo, useCallback } from 'react';
import { Camera, ImagePlus } from 'lucide-react';
import { API_URL } from '@/lib/api';

const ReactQuill = dynamic(
    async () => {
        const { default: RQ } = await import("react-quill-new");
        return ({ forwardedRef, ...props }: any) => <RQ ref={forwardedRef} {...props} />;
    },
    { ssr: false }
);

interface RichTextEditorProps {
    value: string;
    onChange: (value: string) => void;
    placeholder?: string;
    className?: string;
    token?: string;
    minHeight?: number;
    compact?: boolean; // compact = simplified toolbar (for answer options)
    showCamera?: boolean; // show camera capture button for mobile
    onCameraOpen?: () => void;  // called before opening camera/gallery (to pause anti-cheat)
    onCameraClose?: () => void; // called after file selected or cancelled
}

export default function RichTextEditor({
    value,
    onChange,
    placeholder,
    className,
    token,
    minHeight = 150,
    compact = false,
    showCamera = false,
    onCameraOpen,
    onCameraClose,
}: RichTextEditorProps) {
    const quillRef = useRef<any>(null);
    const cameraInputRef = useRef<HTMLInputElement>(null);
    const galleryInputRef = useRef<HTMLInputElement>(null);

    const insertImageFromFile = useCallback(async (file: File) => {
        const formData = new FormData();
        formData.append('image', file);
        try {
            const res = await fetch(`${API_URL}/upload/image`, {
                method: 'POST',
                headers: token ? { Authorization: `Bearer ${token}` } : {},
                body: formData,
            });
            if (!res.ok) throw new Error('Upload failed');
            const data = await res.json();
            const imageUrl = data.url.startsWith('http') ? data.url : `${API_URL}${data.url}`;

            const editor = quillRef.current?.getEditor?.();
            if (editor) {
                const range = editor.getSelection(true) ?? { index: editor.getLength(), length: 0 };
                editor.insertEmbed(range.index, 'image', imageUrl);
                editor.setSelection(range.index + 1);
            }
        } catch {
            alert('Gagal mengupload gambar. Coba lagi.');
        }
    }, [token]);

    // toolbarInputRef: persistent hidden input for toolbar image button (avoids browser blocking dynamic input.click())
    const toolbarInputRef = useRef<HTMLInputElement>(null);

    const imageHandler = useCallback(() => {
        // Trigger the persistent DOM input instead of creating a dynamic one
        toolbarInputRef.current?.click();
    }, []);

    const fullModules = useMemo(() => ({
        toolbar: {
            container: [
                [{ 'header': [1, 2, 3, false] }],
                [{ 'font': [] }],
                [{ 'size': ['small', false, 'large', 'huge'] }],
                ['bold', 'italic', 'underline', 'strike'],
                [{ 'color': [] }, { 'background': [] }],
                [{ 'script': 'sub' }, { 'script': 'super' }],
                ['blockquote', 'code-block'],
                [{ 'list': 'ordered' }, { 'list': 'bullet' }],
                [{ 'indent': '-1' }, { 'indent': '+1' }],
                [{ 'align': [] }],
                ['link', 'image'],
                ['clean'],
            ],
            handlers: { image: imageHandler },
        },
    }), [imageHandler]);

    const compactModules = useMemo(() => ({
        toolbar: {
            container: [
                ['bold', 'italic', 'underline', 'strike'],
                [{ 'color': [] }],
                [{ 'script': 'sub' }, { 'script': 'super' }],
                ['link', 'image'],
                ['clean'],
            ],
            handlers: { image: imageHandler },
        },
    }), [imageHandler]);

    const modules = compact ? compactModules : fullModules;

    const formats = [
        'header', 'font', 'size',
        'bold', 'italic', 'underline', 'strike',
        'color', 'background',
        'script',
        'blockquote', 'code-block',
        'list', 'indent',
        'align',
        'link', 'image',
    ];

    return (
        <div className={`rich-text-editor-wrap ${className ?? ''}`}>
            <style jsx global>{`
                .rich-text-editor-wrap .ql-toolbar {
                    border-top-left-radius: 0.5rem;
                    border-top-right-radius: 0.5rem;
                    border-color: hsl(var(--border));
                    background: hsl(var(--muted) / 0.4);
                    flex-wrap: wrap;
                }
                .rich-text-editor-wrap .ql-container {
                    border-bottom-left-radius: 0.5rem;
                    border-bottom-right-radius: 0.5rem;
                    border-color: hsl(var(--border));
                    font-size: 0.875rem;
                }
                .rich-text-editor-wrap .ql-editor {
                    min-height: ${minHeight}px;
                    background: hsl(var(--background));
                    color: hsl(var(--foreground));
                }
                .rich-text-editor-wrap .ql-editor.ql-blank::before {
                    color: hsl(var(--muted-foreground));
                    font-style: normal;
                }
                .rich-text-editor-wrap .ql-snow .ql-picker-label,
                .rich-text-editor-wrap .ql-snow .ql-stroke {
                    stroke: hsl(var(--foreground) / 0.7);
                }
                .rich-text-editor-wrap .ql-snow .ql-fill {
                    fill: hsl(var(--foreground) / 0.7);
                }
                .rich-text-editor-wrap .ql-snow .ql-picker-label:hover,
                .rich-text-editor-wrap button:hover .ql-stroke {
                    stroke: hsl(var(--foreground));
                }
                .rich-text-editor-wrap .ql-snow.ql-toolbar button.ql-active,
                .rich-text-editor-wrap .ql-snow.ql-toolbar button:hover {
                    color: hsl(var(--primary));
                }
                .rich-text-editor-wrap .ql-snow .ql-picker-options {
                    background: hsl(var(--background));
                    border-color: hsl(var(--border));
                    z-index: 9999;
                }
                .rich-text-editor-wrap img {
                    max-width: 100%;
                    height: auto;
                }
            `}</style>
            <ReactQuill
                forwardedRef={quillRef}
                theme="snow"
                value={value || ''}
                onChange={onChange}
                placeholder={placeholder}
                modules={modules}
                formats={formats}
            />

            {/* Persistent hidden input for toolbar image button */}
            <input
                ref={toolbarInputRef}
                type="file"
                accept="image/*"
                className="hidden"
                onChange={async (e) => {
                    const file = e.target.files?.[0];
                    if (file) await insertImageFromFile(file);
                    e.target.value = '';
                }}
            />

            {/* Camera / gallery buttons for mobile (essay answer) */}
            {showCamera && (
                <div className="flex gap-2 mt-2">
                    {/* Hidden input: kamera langsung (capture environment = kamera belakang) */}
                    <input
                        ref={cameraInputRef}
                        type="file"
                        accept="image/*"
                        capture="environment"
                        className="hidden"
                        onChange={async (e) => {
                            const file = e.target.files?.[0];
                            if (file) await insertImageFromFile(file);
                            e.target.value = '';
                            onCameraClose?.();
                        }}
                    />
                    {/* Hidden input: galeri */}
                    <input
                        ref={galleryInputRef}
                        type="file"
                        accept="image/*"
                        className="hidden"
                        onChange={async (e) => {
                            const file = e.target.files?.[0];
                            if (file) await insertImageFromFile(file);
                            e.target.value = '';
                            onCameraClose?.();
                        }}
                    />
                    <button
                        type="button"
                        onClick={() => { onCameraOpen?.(); cameraInputRef.current?.click(); }}
                        className="flex items-center gap-1.5 rounded-md border border-border bg-muted/50 px-3 py-1.5 text-xs font-medium text-foreground hover:bg-muted transition"
                    >
                        <Camera size={14} />
                        Foto Langsung
                    </button>
                    <button
                        type="button"
                        onClick={() => { onCameraOpen?.(); galleryInputRef.current?.click(); }}
                        className="flex items-center gap-1.5 rounded-md border border-border bg-muted/50 px-3 py-1.5 text-xs font-medium text-foreground hover:bg-muted transition"
                    >
                        <ImagePlus size={14} />
                        Unggah Gambar
                    </button>
                </div>
            )}
        </div>
    );
}

