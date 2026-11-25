# Repository Guidelines

## Project Structure & Module Organization

This repository is a Typst package for INRTU ISTb reports. The public entry point is `lib.typ`, which exposes the `report` wrapper, formatting, title-page helpers, and utilities. Implementation code lives under `src/`:

- `src/format/` contains page, text, heading, list, outline, reference, figure, bibliography, and related layout rules.
- `src/templates/report_title/` contains the report title-page template.
- `src/utils/` contains reusable helpers, including CSV parsing, enumerations, parts, and figure/table support.
- `src/global.typ` stores shared definitions, and `src/logo.png` is the package logo.
- `typst.toml` defines package metadata and the `lib.typ` entrypoint.

There is no dedicated test directory. Keep new modules in the closest existing `src/` subdirectory and update `lib.typ` when adding public APIs.

## Build, Test, and Development Commands

Use the Typst CLI from the repository root:

- `typst compile path/to/example.typ` compiles a document that imports this package.
- `typst watch path/to/example.typ` recompiles automatically while editing.
- `typst compile --root . path/to/example.typ` is useful when an example uses repository-local assets.

No project-specific build script or test runner is configured. Validate changes by compiling a representative report and checking layout and references.

## Coding Style & Naming Conventions

Write Typst with two-space indentation, one declaration per line, and descriptive lowercase names joined with underscores (for example, `report_title` and `parse_csv`). Keep imports grouped at the top of each file. Prefer small reusable `#let` functions and preserve the existing module boundaries. Use `.typ` for Typst source and lowercase hyphenated names only where an existing filename already follows that pattern, such as `parse-csv.typ`.

## Testing Guidelines

For formatting changes, compile a representative document and inspect headings, lists, figures, bibliography output, and page breaks. For utility changes, exercise normal and edge-case inputs. Record any required fixtures so another contributor can reproduce the check.

## Commit & Pull Request Guidelines

Recent commits use concise imperative Russian descriptions, such as `Исправлен отступ в заголовке bibliography` and `Добавлена функция parse-csv`. Follow that convention by stating the user-visible change briefly and specifically. Pull requests should explain the affected Typst modules, include compilation or visual validation steps, and attach rendered output screenshots or PDFs when layout changes are involved. Mention any package metadata or compatibility implications in the description.

## Configuration and Assets

Keep package metadata in `typst.toml` synchronized with public API changes. Preserve licensing information and reference assets through repository-relative paths so the package remains portable when installed by Typst.
