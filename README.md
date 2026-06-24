# vim-gsql

![Vim](https://img.shields.io/badge/Vim-plugin-019733?logo=vim&logoColor=white&style=flat-square)
![GoogleSQL](https://img.shields.io/badge/GoogleSQL-syntax-4285F4?logo=google&logoColor=white&style=flat-square)

Vim syntax highlighting plugin for GoogleSQL and related languages.

> [!tip]
> <details>
> <summary>Features</summary>
> 
> - GoogleSQL keywords, 150+ built-in functions, data types
> - BigQuery: ML functions (`ML_PREDICT`, `AI.GENERATE`, etc.), geography, JSON, statistical functions
> - Dataform (.sqlx): `config {}` blocks, `ref()` / `resolve()` / `self()`, `pre_operations` / `post_operations` / `js` blocks
> - Google Cloud Spanner: `INTERLEAVE`, `STORING`, `TOKENIZE_*`, Spanner-specific types (`FLOAT32`, `INT32`, `TOKENLIST`)
> - LookML (.lkml / .lookml): block declarations, properties, SQL embedding with GoogleSQL highlighting
> - Looker Liquid templates: `{{ }}`, `{% %}`, LookML field references `${view.field}`
> - Visual aids: operator highlighting, table alias prefix, backtick-quoted identifiers, comma
> - Code folding for SQL statements (`CREATE`, `SELECT`, `INSERT`, `MERGE`, `WITH`, etc.)
> - Colorscheme support: works with any colorscheme via standard highlight groups, with optimized colors for [iceberg.vim](https://github.com/cocopon/iceberg.vim) (auto-detected)
> 
> </details>

## Filetypes

 Support |Service | Category | Description
 :-: | --- | --- | ---
 ◻︎ |![CloudSQL](https://img.shields.io/badge/Cloud%20SQL-4285F4?logo=googlecloudsql&logoColor=white&style=flat-square)| RDB (OLTP) | MySQL, PostgreSQL, SQL Server compatible. Easy migration.
 ☑︎ |![Spanner](https://img.shields.io/badge/Spanner-4285F4?logo=googlecloudspanner&logoColor=white&style=flat-square) | RDB (OLTP) | Globally distributed database with NoSQL scalability.
 ◻︎ |![Bigtable](https://img.shields.io/badge/Bigtabel-669DF6?logo=googlebigtabele&logoColor=white&style=flat-square)  | NoSQL | Wide-column store for large analytical and operational workloads.
 ☑︎ |![BigQuery](https://img.shields.io/badge/BigQuery-669DF6?logo=googlebigquery&logoColor=white&style=flat-square)   | DWH (OLAP) | Serverless, scalable data warehouse for large-scale analytics.
 ☑︎ | Dataform | ETL/ELT   | SQL workflow definitions in SQLX format.
 ☑︎ |![Looker](https://img.shields.io/badge/Looker-4285F4?logo=looker&logoColor=white&style=flat-square)               | BI        | Semantic modeling layer defined in LookML.

## Installation

### Vim packages (Vim 8+)

```bash
git clone https://github.com/shiroimon/vim-gsql.git ~/.vim/pack/plugins/start/vim-gsql
```

### Package Manager

- vim-plug
  ```vim
  Plug 'shiroimon/vim-gsql'
  ```

- Vundle
  ```vim
  Plugin 'shiroimon/vim-gsql'
  ```

## License

[MIT](LICENSE.md)

LookML support is based on [vim-lookml](https://github.com/chrismaher/vim-lookml) by Chris Maher (MIT License).
