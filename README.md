# Duotify.Templates.DotNetNew

本專案為「多奇教育訓練」製作的 `dotnet new` 範本專案，用於建立多個不同的**專案範本**(Project Templates)與**項目範本**(Item Templates)。

## 安裝範本

```sh
dotnet new -i Duotify.Templates.DotNetNew
```

## 更新範本

```sh
dotnet new -i Duotify.Templates.DotNetNew
```

## 移除範本

```sh
dotnet new -u Duotify.Templates.DotNetNew
```

## 專案範本 (Project Templates)

- jconsole

    **說明**

    提供一個包含 Java 基礎專案的專案範本。

    **用法**

    ```sh
    dotnet new jconsole -c "YOUR-NAME" -n "your-app-name"
    ```

    **範例 1**

    ```sh
    dotnet new jconsole -c "Will 保哥" -n "CheckClassPath"
    cd CheckClassPath
    java CheckClassPath.java
    ```

- tsnode

    **說明**

    提供一個包含 Node.js + TypeScript + Nodemon + ts-node + VSCode 完整開發環境的專案範本。

    **用法**

    ```sh
    dotnet new tsnode -c "YOUR-NAME" -n "your-app-name"
    ```

    **範例 1**

    ```sh
    dotnet new tsnode -c "Will 保哥" -n "myweb"
    cd myweb
    npm install
    ```

    **範例 2**

    ```sh
    mkdir myweb && cd myweb
    dotnet new tsnode -c "Will 保哥"
    npm install
    ```

- tsnode-esm

    **說明**

    提供一個包含 Node.js + TypeScript 5 (ESM) + Nodemon + ts-node + VSCode + esbuild 完整開發環境的專案範本。

    **用法**

    ```sh
    dotnet new tsnode-esm -c "YOUR-NAME" -n "your-app-name"
    ```

    **範例 1**

    ```sh
    dotnet new tsnode-esm -c "Will 保哥" -n "myweb"
    cd myweb
    npm install
    ```

    **範例 2**

    ```sh
    mkdir myweb && cd myweb
    dotnet new tsnode-esm -c "Will 保哥"
    npm install
    ```

- antlr

    **說明**

    提供一個包含 [ANTLR](https://www.antlr.org/) 完整範例的 .NET 6 Console 專案範本。

    **用法**

    ```sh
    dotnet new antlr -c "YOUR-NAME" -n "YOUR-APP-NAME"
    ```

    **範例**

    ```sh
    dotnet new antlr -c "Will 保哥" -n "PowerBuilder"
    ```

- go

    **說明**

    提供一個最輕量的 Go CLI 專案範本，只有基本的 `main.go` 並使用到 `flag` 套件。

    **用法**

    ```sh
    dotnet new go -c "YOUR-NAME" -g "YOUR-GitHub-ID" -n "YOUR-APP-NAME"
    ```

    **範例**

    ```sh
    dotnet new go -c "Will 保哥" -g "doggy8088" -n myapp
    ```

- gobasic

    **說明**

    依據 [Standard Go Project Layout](https://github.com/golang-standards/project-layout) 提供一個稍微基礎的 Go 專案範本。

    **用法**

    ```sh
    dotnet new gobasic -c "YOUR-NAME" -g "YOUR-GitHub-ID" -n "YOUR-APP-NAME"
    ```

    **範例**

    ```sh
    dotnet new gobasic -c "Will 保哥" -g "doggy8088" -n myapp
    ```

- gofull

    **說明**

    依據 [Standard Go Project Layout](https://github.com/golang-standards/project-layout) 提供一個相當完整的 Go 專案範本。

    **用法**

    ```sh
    dotnet new gofull -c "YOUR-NAME" -g "YOUR-GitHub-ID" -n "YOUR-APP-NAME"
    ```

    **範例**

    ```sh
    dotnet new gofull -c "Will 保哥" -g "doggy8088" -n myapp
    ```

- golib

    **說明**

    依據 [Standard Go Project Layout](https://github.com/golang-standards/project-layout) 提供一個可成為共用函式庫的 Go 專案範本。

    **用法**

    ```sh
    dotnet new golib -c "YOUR-NAME" -g "YOUR-GitHub-ID" -n "YOUR-APP-NAME"
    ```

    **範例**

    ```sh
    dotnet new golib -c "Will 保哥" -g "doggy8088" -n myapp
    ```

- gogin

    **說明**

    提供一個包含 [Gin Web Framework](https://github.com/gin-gonic/gin) 完整範例的 Go 專案範本。

    **用法**

    ```sh
    dotnet new gogin -c "YOUR-NAME" -g "YOUR-GitHub-ID" -n "YOUR-APP-NAME"
    ```

    **範例**

    ```sh
    dotnet new gogin -c "Will 保哥" -g "doggy8088" -n myapp
    ```

## 項目範本 (Item Templates)

- efr

    **說明**

    提供 C# 與 Entity Framework Core 專案的 EFRepository 與 Unit of Work 實作範本檔案。

    建立的檔案中會有個 CourseRepository.cs 為範例程式，裡面的程式都是註解掉的。

    **用法**

    ```sh
    dotnet new efr
    ```

    **範例**

    ```sh
    dotnet new efr
    ```

## 測試範本

1. 移除與安裝

    ```ps1
    dotnet new --uninstall "$PWD\project-templates\jconsole"
    dotnet new -i ./project-templates/jconsole
    dotnet new jconsole -c "Will 保哥" -n "CheckClassPath" -o G:\myapp --force
    code G:\myapp
    ```

2. 列出已安裝範本

    ```ps1
    dotnet new --uninstall
    ```

3. 移除現有範本

    ```ps1
    dotnet new --uninstall "$PWD\project-templates\jconsole"
    ```

## 建置與發行 NuGet 套件

1. 先更新 `Duotify.Templates.DotNetNew.csproj` 的 `<PackageVersion>` 屬性

    更新為新的版本號碼，例如 `1.8.0`。

2. 封裝套件

    ```sh
    dotnet pack
    ```

    > 此命令會產生一個 `bin/Release/Duotify.Templates.DotNetNew.X.X.X.nupkg` 檔案。

    目前 `antlr4` 的專案範本在 .NET 9 的 .NET CLI 似乎會建置過，導致會產生 `bin` 與 `obj` 目錄，且檔案還很大，全部都會被包進 `Duotify.Templates.DotNetNew.X.X.X.nupkg` 檔案中，目前需要在封裝後手動移除。移除的路徑在：`content/project-templates/antlr4/bin` 與 `content/project-templates/antlr4/obj`。

3. 到 [NuGet Gallery | Manage My Package](https://www.nuget.org/account/Packages) 執行 **Add new** 上傳新版本

    ```ps1
    bin/Release/Duotify.Templates.DotNetNew.X.X.X.nupkg
    ```

4. 按下 **Submit** 按鈕送審！

    通常 5 分鐘以內就可以變成 `Listed` 狀態！

    <https://www.nuget.org/packages/Duotify.Templates.DotNetNew/>

5. 更新 GitHub 的 [Releases](https://github.com/doggy8088/Duotify.Templates.DotNetNew/releases) 資訊

    `Draft a new release`

    設定 `CHANGELOG.md` 的內容

    上傳 `bin/Debug/Duotify.Templates.DotNetNew.X.X.X.nupkg` 檔案
