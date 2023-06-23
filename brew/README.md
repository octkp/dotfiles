# Brew Bundle

## インストール

```sh
$ brew tap Homebrew/bundle
```



## コマンドオプション

### `brew bundle` :リストファイルから一括インストール

```shell
$ touch Brewfile
$ brew bundle
```

- `--global` ホームディレクトリのリストファイル`~/.Brewfile`を使用

- `--file 'path/filename'` リストファイルを指定



### `dump` :インストールリストファイル作成

```shell
$ brew bundle dump
```

- 現在のディレクトリに `Brewfile` を作成しインストールリストを出力

  ```Brewfile
  ap "homebrew/cask"
  tap "user/tap-repo", "https://user@bitbucket.org/user/homebrew-tap-repo.git"
  cask_args appdir: "/Applications"
  
  brew "imagemagick"
  brew "denji/nginx/nginx-full", args: ["with-rmtp-module"]
  brew "mysql@5.6", restart_service: true, link: true, conflicts_with: ["mysql"]
  
  cask "firefox", args: { appdir: "~/my-apps/Applications" }
  cask "google-chrome"
  cask "java" unless system "/usr/libexec/java_home --failfast"
  cask "homebrew/cask-fonts/font-charter"
  
  mas "1Password", id: 443987910
  ```

- オプション
    - `--force` リストファイルを強制上書き
    - `--global` ホームディレクトリにリストファイル`.Brewfile`を作成
    - `--file 'path/filename'` リストファイルを指定
    - `--describe 'comment'` コメント行にcommentを出力



### `cleanup` :アプリ・パッケージ一括削除

- Brewfileに記載のないアプリケーションをリスト表示する
- オプション
    - `--force` リストせずにアンインストール
    - `--global` ホームディレクトリのリストファイル`~/.Brewfile`を使用
    - `--file 'path/filename'` リストファイルを指定



### `check` :Brewfile記載の内、インストール・アップグレードが必要なものを表示

- オプション
    - `--force` リストせずにアンインストール
    - `--global` ホームディレクトリのリストファイル`~/.Brewfile`を使用
    - `--file 'path/filename'` リストファイルを指定

### `list` :Brewfile記載のリストを表示する

- オプション
    - `—cask`,`—taps`,`—mas`,`--brews` で表示形式指定、defaultが`--brews`、`--all`ですべて表示
    - `--global` ホームディレクトリのリストファイル`~/.Brewfile`を使用
    - `--file 'path/filename'` リストファイルを指定
