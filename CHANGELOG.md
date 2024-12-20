# Duotify.Templates.DotNetNew

All notable changes to the **Duotify.Templates.DotNetNew** package will be documented in this file.

## 1.8.0 - 2024-12-14

- Remove `editorconfig` item template.
  - .NET 9 SDK already includes the `editorconfig` item template.

## 1.7.2 - 2023-10-25

- Fix some issues for `tsnode-esm` project template.
  - Update `tsconfig.json` to a minimized version, removed duplicated settings from `@tsconfig/node-lts/tsconfig.json`.

## 1.7.1 - 2023-10-25

- Fix some issues for `tsnode-esm` project template.
  - Use `esbuiild` to bundle ESM modules.
  - Update `tsconfig.json` to support `Bundler` moduleResolution.

## 1.7.0 - 2023-10-25

- Add `tsnode-esm` project template.
  - TypeScript 5 + Node.js with ESM support

## 1.6.0 - 2023-05-18

- Add `efr` item template.
  - EFRepository & Unit of Work

## 1.5.2 - 2022-07-29

- Bug fixed

## 1.5.0 - 2022-07-29

- Add `jconsole` project template
  - A basic Java console app
- Update LICENSE's year

## 1.4.1 - 2021-07-22

- Add `"resolveJsonModule": true` to `tsnode` project template

## 1.4.0 - 2021-07-18

- Add `tsnode` project template
  - Node.js + TypeScript + Nodemon + ts-node + VSCode

## 1.3.0 - 2021-07-08

- Add `antlr` project template
  - Support for .NET 6 Console App
  - Use [System.CommandLine.DragonFruit](https://www.nuget.org/packages/System.CommandLine.DragonFruit) for CLI arguments parsing.

## 1.2.1 - 2020-11-03

- Add `/dist/` to the `.gitignore` file.
- Remove translation link in `README.md`.

## 1.2.0 - 2020-11-03

Add the following Go project templates:

1. `go` - Go Project (CLI)
2. `gobasic` - Go Project (Basic layout)
3. `gofull` - Go Project (Full layout)
4. `golib` - Go Project (Library layout)
5. `gogin` - Go Project with Gin Web Framework

## 1.1.0 - 2020-11-01

1. Remove `project-templates\go\main.go` file.
2. Update `project-templates\go\README.md` to **Traditional Chinese**.

## 1.0.0 - 2020-10-31

Initial release with `go` and `editorconfig` templates.
