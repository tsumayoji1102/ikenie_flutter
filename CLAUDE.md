# Claude AI 開発支援ドキュメント

## プロジェクト概要

このプロジェクトは Flutter を使用したモバイルアプリケーション開発プロジェクトです。

## プロジェクト構成について

詳細なプロジェクト構成については、以下のドキュメントを参照してください：

📁 **[ai_docs/README.md](./ai_docs/README.md)** - プロジェクト全体の画面構成と技術構成

## 開発時の参考情報

### 主な機能・画面

- タブベースの UI（6 つのタブ）
- カレンダー表示機能
- 写真管理・描画機能
- ルーティング機能
- キーボードアクション機能

### 使用している主要技術

- Flutter Hooks
- Go Router
- Syncfusion Calendar
- Photo Manager
- Signature (描画機能)
- Freezed (データクラス生成)

### 開発・作業時の注意点

1. コード生成を使用しているため、変更後は `flutter packages pub run build_runner build` の実行が必要
2. 学習用ファイル（lesson_1~2.dart, lesson_3.dart）は実験・学習目的
3. 各タブの実装は `lib/ui/tab/` 配下で管理
4. ページ遷移は `lib/ui/router/router_setting.dart` で定義

---

詳細な技術仕様や画面構成については、上記リンクの README.md をご確認ください。
