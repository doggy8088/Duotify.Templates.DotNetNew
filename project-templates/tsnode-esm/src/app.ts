import * as fs from "fs";

const content = fs.readFileSync("tsconfig.json", "utf8");

console.log(content);
