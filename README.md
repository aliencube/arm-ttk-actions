# ARM Template Toolkit (ARM TTK) Actions #

This is a GitHub Actions that runs the [ARM Test Toolkit (ARM TTK)](https://github.com/Azure/arm-ttk) against your ARM templates.


## Inputs ##

* `path` (**Required**): ARM Template file path to run the test. It can be either a directory or single file.
* `files`: ARM template files to run the test, delimited by comma.
* `tests`: Tests to run, delimited by comma. If omitted, all tests will be run.
* `skips`: Tests to skip, delimited by comma. If omitted, no test will be excluded.


## Outputs ##

* `results`: Test results.


## Example Usages ##

### Run ARM TTK against Path ###

```yaml
steps:
- name: Run the private action - path
  id: pathtest
  uses: ./
  with:
    path: ./sample.json

- name: Test result - path
  shell: bash
  continue-on-error: true
  run: |
    results=${{ steps.pathtest.outputs.results }}
    echo "Results $results"
```


### Run ARM TTK against Files ###

```yaml
steps:
- name: Run the private action - files
  id: filestest
  uses: ./
  with:
    path: ./
    files: sample.json

- name: Test result - files
  shell: bash
  continue-on-error: true
  run: |
    echo ${{ steps.filestest.outputs.results }}
    echo "Results $results"
```


### Run ARM TTK by Specifying Tests ###

```yaml
steps:
- name: Run the private action - specify tests
  id: teststest
  uses: ./
  with:
    path: ./
    files: sample.json
    tests: apiVersions Should Be Recent,Resources Should Have Location

- name: Test result - specify tests
  shell: bash
  continue-on-error: true
  run: |
    results=${{ steps.teststest.outputs.results }}
    echo "Results $results"
```


### Run ARM TTK by Skipping Tests ###

```yaml
steps:
- name: Run the private action - skip tests
  id: skipstest
  uses: ./
  with:
    path: ./
    files: sample.json
    skips: apiVersions Should Be Recent,Resources Should Have Location

- name: Test result - skp tests
  shell: bash
  continue-on-error: true
  run: |
    echo ${{ steps.skipstest.outputs.results }}
    echo "Results $results"
```


## Known Issues ##

* Output has ANSI color codes that throw errors. For its workaround, set the `continue-on-error` attribute to be `true`.


## Contribution ##

Your contributions are always welcome! All your work should be done in your forked repository. Once you finish your work with corresponding tests, please send us a pull request onto our `main` branch for review.


## License ##

**ARM Template Toolkit (ARM TTK) Actions** is released under [MIT License](http://opensource.org/licenses/MIT)

> The MIT License (MIT)
>
> Copyright (c) 2020 [aliencube.org](https://aliencube.org)
> 
> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
