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
