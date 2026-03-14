"use client";

import dynamic from 'next/dynamic';
import 'react-quill-new/dist/quill.snow.css';
import { useRef, useMemo } from 'react';

// Dynamic import for ReactQuill to avoid SSR issues
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
}

export default function RichTextEditor({ value, onChange, placeholder, className }: RichTextEditorProps) {
    const quillRef = useRef<any>(null);

    const modules = useMemo(() => ({
        toolbar: [
            [{ 'header': [1, 2, 3, false] }],
            ['bold', 'italic', 'underline', 'strike', 'blockquote'],
            [{ 'list': 'ordered' }, { 'list': 'bullet' }, { 'indent': '-1' }, { 'indent': '+1' }],
            ['link', 'image'],
            ['clean']
        ],
    }), []);

    return (
        <div className={`prose-editor ${className}`}>
            <style jsx global>{`
                .ql-container {
                    border-bottom-left-radius: 0.5rem;
                    border-bottom-right-radius: 0.5rem;
                    background-color: transparent;
                }
                .ql-toolbar {
                    border-top-left-radius: 0.5rem;
                    border-top-right-radius: 0.5rem;
                    background-color: transparent;
                }
                .ql-editor {
                    min-height: 150px;
                }
            `}</style>
            <ReactQuill
                forwardedRef={quillRef}
                theme="snow"
                value={value || ''}
                onChange={onChange}
                placeholder={placeholder}
                modules={modules}
                className="bg-background rounded-lg"
            />
        </div>
    );
}
