Ruby project template from [naliwajek/ruby-starter](https://github.com/naliwajek/ruby-starter)

# Take home test

Results saved in `output.txt` as requested.

## Requirements
* Docker (_mine was v19.03.13_)
* Make (_for `make` command_)

## How to run it

To see how it all works without hitting the Internet, see this spec:

```
spec/invites/use_case/create_guests_list_spec.rb
```

To run it against live Internet, you can use this command below - it's going to execute `script.rb` and print the results:

```
make results
```

## Commands

Build image

```
make build
```

Run tests, should be all green, press any key to re-run:

```
make test
```

To get into `bash` shell run:

```
make bash
```

For project's `bundle console` run:

```
make console
```
