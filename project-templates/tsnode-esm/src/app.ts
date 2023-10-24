import * as fs from "fs";

import { version } from "./utils.js";

console.log(version);

const content = fs.readFileSync("tsconfig.json", "utf8");
console.log(content);
