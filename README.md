# `quarto-cv` Format

This is a simple Quarto + Typst template for academic CVs.
The data inputs are driven by YAML and bib files, allowing for nice version control abilities.

<!-- pdftools::pdf_convert('template.pdf', pages = 1) -->
![[template.qmd](template.qmd)](template_1.png)

## Installing

```bash
quarto use template christopherkenny/quarto-cv
```

This will install the format extension and create an example qmd file
that you can use as a starting place for your document.

## Using `quarto-cv`

This extension builds your CV using [Quarto](https://quarto.org/) with a [Typst](https://github.com/typst/typst) backend. The goal of this template is to explore combining two of the best features of Quarto and Typst.
Typst allows you to provide data as YAML and format it from there, while Quarto allows you to use "shortcodes" to insert arbitrary code at a given point.

Together, this allows you to control where you'd like a certain type of data with a simple syntax.
Most of the customization can be controlled by using shortcodes like below:

```
{{< cv type file >}}`.
```
- type: points to one of the supported shortcode types below
- file: points to a file with a field with the same title as `type`

The types supported currently are `education`, `positions`, `honors`, and `appointments`. These can be used for similarly-suited work. For example, in the included template, I use `positions` as a stand in for service, where I want the information displayed to be (1) year, (2) an organization, and (3) some description of the service.

This allows you to create your own sections and just use these as nice ways to format the information in grids.

Finally, this makes use of bibtex `.bib` files to list your writings. This is adaptable as well by using `divs`. (In a future version, this will be able to use a multiple bibliography approach in raw Typst, but this is blocked by an upstream PR into Quarto currently.)

Here, you should supply each type of listing of your bibliography as its own file. For example, splitting books from articles will allow you to list those separately.

### YAML custom options

- `author`: controls what is displayed in the header block on the first page. The only part required is a name. Full choices are below:

```yaml
author:
  - name: Sidney Verba
    url: https://en.wikipedia.org/wiki/Sidney_Verba
    phone: 123456789
    email: "example@harvard.edu"
    degrees:
      - PhD
    affiliations:
      - name: Harvard University
        department: Department of Government
    title: "Carl H. Pforzheimer University Professor (Emeritus)"
```

- `linestretch`: line spacing. In academic fashion, the default is 1 (single-spaced)
- `linkcolor`: Add a splash of colors to your link.

To control the bibliography listings, use the YAML like so:


- `csl`: set a CSL file to format bibliographic entries with. I include `revsort-chicago-author-date.csl` and `nosort-chicago-author-date.csl` which respectively provide a reverse sorted by year and an unsorted version of the `chicago-author-date` style.

- `bibliography`: set sources to include. This is explained in detail in the demo document, but it should look like below, where each subentry (`books` here) lists a `.bib` file in your directory.

```yaml
bibliography:
  books: "books.bib"
```

Finally, if using this template, you *almost* always need to include the following to allow unreferenced citations to be listed.

```yaml
nocite: '@*'
```


## License

This is licensed under an [MIT License](LICENSE). This gives you substantial freedom to adapt the cv to your needs and to share those adaptations. Note that using this template does not restrict your use of the template to make a CV. Your CV is your CV, not a product of mine! The license is to explicitly let you know how you can share any edits of the template should you have new formatting ideas and want to distribute those.
