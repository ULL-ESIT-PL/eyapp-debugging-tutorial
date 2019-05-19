* Saved to GitHub in 2018. 

* [Tutorial at CPAN Parse::Eyapp::debuggingtut](https://metacpan.org/pod/release/CASIANO/Parse-Eyapp-1.182/lib/Parse/Eyapp/debuggingtut.pod)

* Use version 1.182 for this examples. I am not sure if they will work with current versions of [Eyapp](https://metacpan.org/pod/distribution/Parse-Eyapp/eyapp):

  ```
  $ eyapp -V
  This is Parse::Eyapp version 1.182.
  ```
* Available options:

  ```
  $ eyapp -h
  Usage:  eyapp [options] grammar[.eyp]
    or    eyapp -V
    or    eyapp -h

      -m module   Give your parser module the name <module>
                  default is <grammar>
      -v          Create a file <grammar>.output describing your parser
                  The LALR tables aren't compacted
      -vN         Create a file <grammar>.output describing your parser
                  LALR tables are compacted.
      -w          Create a file <grammar>.dot graph describing your parser.
                  You can then generate a .png file using dot:
                              dot -Tpng  grammar.dot -o grammar.png
      -W          Create a file <grammar>.dot graph describing your parser
                  Nodes are labelled with core LR-items
      -s          Create a standalone module in which the driver is included
      -S symbol   Use 'symbol' as start symbol of the grammar
      -n          Disable source file line numbering embedded in your parser
      -o outfile  Create the file <outfile> for your parser module
                  Default is <grammar>.pm or, if -m A::Module::Name is
                  specified, Name.pm
      -t filename Uses the file <filename> as a template for creating the parser
                  module file.  Default is to use internal template defined
                  in Parse::Eyapp::Output
      -b shebang  Adds '#!<shebang>' as the very first line of the output file
      -B prompt   Adds a modulino call '__PACKAGE->main(<prompt>) unless caller();' 
                  as the very last line of the output file
      -C          An abbreviation for the combined use of -b ''  -B ''
      -T          Equivalent to %tree
      -N          Equivalent to %nocompact. Do not compact action tables. 
      -l          Do not generate the lexical analyzer. One must be explictly provided
      -P          Accept if prefix conforms to the language, even if is not legal up 
                  to the end 
      -c grammar  Displays the "clean" grammar without actions     
      -vc grammar Displays the "clean" grammar without actions. Strip comments also
      -V          Display current version of Parse::Eyapp and gracefully exits
      -h          Display this help screen

      grammar     The grammar file. If no suffix is given, and the file
                  does not exists, .eyp is added
  ```
