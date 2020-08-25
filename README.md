# hello-chef
テスト用cookbook

# 試してみたこと
以下の「使ってみる」と「attributeとtemplate機能を使って、設定ファイルを作成する」に従って試した。
- https://github.com/tsuyopon/memo/blob/master/Chef/test-kitchen.md

以下に従ってdatabagを使って機密情報を登録してみる
- https://github.com/tsuyopon/memo/blob/master/Chef/databag.md

nodes, roles, environmentsを作成した。(本来はnodes, roles, environmentsは別のレポジトリの方がいいのかもしれない)


以下に従ってカスタムリソースを配置した(resources/greet.rb, spec/greet_spec.rbの作成)
- https://github.com/chefspec/chefspec/tree/v8.0.0#testing-a-custom-resource
  - 「chef exec rspec」でテストを実行することが可能


