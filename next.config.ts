import type { NextConfig } from "next";

import { getAPIEndpoint } from "./lib/config";
import { writeFileSync } from "node:fs";
import { join } from "node:path";

const envFilePath = join(process.cwd(), "public", "env.js");
writeFileSync(
  envFilePath,
  `window.API_ENDPOINT = "${getAPIEndpoint()}";\n`,
  "utf8"
);
console.log("Environment file created at:", envFilePath);

const nextConfig: NextConfig = {
  /* config options here */
  reactStrictMode: true,
};

export default nextConfig;
