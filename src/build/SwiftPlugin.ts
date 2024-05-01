import { Plugin } from 'vite';
import { watch } from 'chokidar';
import { exec } from 'child_process';
import { promisify } from 'util';

const execAsync = promisify(exec);

const SwiftPlugin = (): Plugin => {
  return {
    name: "vite-plugin-swift",
    configureServer(server) {
      const watcher = watch("Sources/**/*.swift", {
        persistent: true
      });

      watcher.on("change", async (path) => {
        console.log(`${path} changed, rebuilding swift...`);
        try {
          const { stdout, stderr } = await execAsync("bin/build");
          console.log(stdout);
          if(stderr) {
            console.error(stderr);
          }
        } catch (error) {
          console.error("build failed", error);
        }
      });

      server.httpServer?.on("close", () => {
        watcher.close();
      });
    }
  }
};

export default SwiftPlugin;