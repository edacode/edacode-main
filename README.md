# EDACode main

The main repository of EDACode.

## Motivation

EDACode is a platform for building EDA applications based on a number of principles:

- Everything is accessible, everything is code you can modify.
- Everything is "production", and nothing in "local" or "test".
- Everything deals with the three main concepts: messages, state, and code.
- No deployments, no imaginary test cases, no CI/CD.
- Convergence of Object-oriented programming and prototype-based programming.
- Complete auditability and determinism.
- Exception-less programming.

## Design

It extends PharoEDA with the necessary tools and services to support the principles above.

## Usage

Load it with Metacello:

```smalltalk
Metacello new repository: 'github://edacode/edacode-main:main'; baseline: #EDACodeMain load
```

## Work in progress

TBD

## Credits

- Background of the Pharo image by <a href="https://pixabay.com/users/gdj-1086657/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=3166142">Gordon Johnson</a> from <a href="https://pixabay.com/">Pixabay</a>.
