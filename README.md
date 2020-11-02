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

## 專案範本 (Project Templates)

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

- editorconfig

    **說明**

    提供 C# 專案預設的 `.editorconfig` 檔案，其內容參考自 [.NET code style rule options](https://docs.microsoft.com/en-us/dotnet/fundamentals/code-analysis/code-style-rule-options?view=vs-2019&WT.mc_id=DT-MVP-4015686) 官網文件提供的範例。

    若要參考 Roslyn 專案的 `.editorconfig` 檔案，可以看這裡：<https://github.com/dotnet/roslyn/blob/master/.editorconfig>

    **用法**

    ```sh
    dotnet new editorconfig
    ```

    **範例**

    ```sh
    dotnet new editorconfig
    ```

## 移除範本

```sh
dotnet new -u Duotify.Templates.DotNetNew
```

## 建置與發行 NuGet 套件

```sh
dotnet pack
```
