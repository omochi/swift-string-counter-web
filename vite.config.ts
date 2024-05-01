import { defineConfig } from 'vite';
import SwiftPlugin from './src/build/SwiftPlugin';

export default defineConfig({
    plugins: [
        SwiftPlugin()
    ]
});