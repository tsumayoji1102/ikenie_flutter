# Ikenie Flutter プロジェクト構成ドキュメント

## プロジェクト概要

- **プロジェクト名**: ikenie_flutter
- **説明**: A new Flutter project.
- **開発環境**: Flutter SDK 3.3.1 以上

## アーキテクチャ

### 全体構成

```
lib/
├── main.dart                     # エントリーポイント
├── lesson_1~2.dart              # 学習用ファイル
├── lesson_3.dart                # 学習用ファイル
├── model/                       # データモデル
│   ├── sample.dart
│   ├── sample.freezed.dart
│   └── sample.g.dart
└── ui/                          # UIコンポーネント
    ├── dialog/                  # ダイアログ関連
    ├── pages/                   # ページ画面
    ├── router/                  # ルーティング設定
    ├── shared/                  # 共通コンポーネント
    └── tab/                     # タブ関連
```

## アプリケーション画面構成

### メイン画面

- **ファイル**: `lib/main.dart`
- **クラス**: `MyHomePage`
- **機能**: BottomNavigationBar を使用したタブベースの UI

### タブ構成

以下の 6 つのタブで構成されています（`lib/ui/tab/tabs_enum.dart`で定義）：

1. **Calendar**

   - **実装**: `SyncFusionCalendarView`
   - **機能**: Syncfusion カレンダーの表示

2. **Keyboard**

   - **実装**: `KeyboardActionsView`
   - **機能**: キーボードアクション機能

3. **Text View**

   - **実装**: `TextView`
   - **機能**: テキスト表示機能

4. **Lists View**

   - **実装**: `ListsView`
   - **機能**: リスト表示機能

5. **Nested Scroll View**

   - **実装**: `SliverCheckView`
   - **機能**: ネストされたスクロールビュー

6. **Router View**
   - **実装**: `RouterView`
   - **機能**: ルーティング機能の確認

### ページ画面

`lib/ui/pages/`配下に専用ページを定義：

- **claude_list_page.dart**: Claude 関連のリストページ
- **nested_scroll_view_page.dart**: ネストスクロールビューの専用ページ
- **photos_page.dart**: 写真表示ページ（DrawPage）

### ルーティング設定

- **ファイル**: `lib/ui/router/router_setting.dart`
- **ライブラリ**: go_router を使用
- **初期ルート**: `/` (MyHomePage)

#### 定義済みルート

- `/draw_page`: 描画ページ
- `/nested_scroll_view_page`: ネストスクロールビューページ
- `/claude_list_page`: Claude リストページ

## 使用技術・パッケージ

### 主要パッケージ

- **flutter_hooks** (^0.20.5): Hooks パターンの実装
- **go_router** (^14.6.2): ルーティング管理
- **syncfusion_flutter_calendar** (^28.2.7): カレンダー UI
- **photo_manager** (^3.6.3): 写真管理
- **signature** (^5.5.0): 署名・描画機能
- **image_picker** (^1.1.2): 画像選択機能

### 開発支援パッケージ

- **freezed** (^2.5.8): データクラス自動生成
- **json_annotation** (^4.9.0): JSON シリアライゼーション
- **build_runner** (^2.4.15): コード生成ツール

## ディレクトリ構造詳細

### UI コンポーネント構成

```
ui/
├── dialog/
│   └── modal_dialog.dart        # モーダルダイアログ
├── pages/
│   ├── claude_list_page.dart    # Claudeリスト画面
│   ├── nested_scroll_view_page.dart # ネストスクロール画面
│   └── photos_page.dart         # 写真・描画画面
├── router/
│   └── router_setting.dart      # ルーティング設定
├── shared/
│   └── done_keyboard_actions.dart # キーボード完了アクション
└── tab/
    ├── tabs_enum.dart           # タブ定義
    ├── keyboard_actions.dart    # キーボードアクションタブ
    ├── lists_view.dart          # リストビュータブ
    ├── nested_scroll_view.dart  # ネストスクロールタブ
    ├── router_view.dart         # ルータービュータブ
    ├── syncfusion_calendar.dart # カレンダータブ
    └── text_view.dart           # テキストビュータブ
```

### データモデル

```
model/
├── sample.dart           # ベースデータクラス
├── sample.freezed.dart   # Freezed生成ファイル
└── sample.g.dart         # JSON生成ファイル
```

## 学習・実験用ファイル

- **lesson_1~2.dart**: 基礎学習用コード
- **lesson_3.dart**: 応用学習用コード

## 設定ファイル

- **pubspec.yaml**: 依存関係とプロジェクト設定
- **analysis_options.yaml**: 静的解析設定
- **Makefile**: ビルド・タスク自動化

---

_このドキュメントは ikenie_flutter プロジェクトの画面構成と技術構成をまとめたものです。_
