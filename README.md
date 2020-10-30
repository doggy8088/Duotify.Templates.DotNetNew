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

    依據 [Standard Go Project Layout](https://github.com/golang-standards/project-layout) 提供一個 Go 專案範本。

    **用法**

    ```sh
    dotnet new go -c "YOUR-NAME" -g "YOUR-GitHub-ID" -n "YOUR-APP-NAME"
    ```

    **範例**

    ```sh
    dotnet new go -c "Will 保哥" -g "doggy8088" -n myapp
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
