########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'typicalrr.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package typicalrr;
use strict;

push @typicalrr::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "typicalrr.eyp"


=head1 SYNOPSIS

This is an example of a bad grammar design.

There are several sources of ambiguity in this grammar:

=over 2

=item * Statments like 

              NUM NUM NUM

are ambiguous. The following two left-most derivations
exists:

             s =*=> ns ns =*=> NUM NUM ns => NUM NUM NUM
or 

             s =*=> ns ns =*=> NUM ns =*=> NUM NUM NUM
 
the same with phrases like C<ID ID ID>

=item * The empty word can be generated in many ways

        s => empty

or

        s => s ns => s empty => empty

etc.

=back

Compile it with 

            eyapp -b '' typicalrr

The compiler will announce:

   3 shift/reduce conflicts and 3 reduce/reduce conflicts

Study the file C<typicalrr.output>. The 3 reduce/reduce conflicts
occur in state 1:

  State 1:

	$start -> s . $end	(Rule 0)
	s -> s . ws	(Rule 2)
	s -> s . ns	(Rule 3)

	$end	shift, and go to state 3

	$end	[reduce using rule 6 (ws)]
	$end	[reduce using rule 4 (ns)]
	ID	[reduce using rule 6 (ws)]
	NUM	[reduce using rule 6 (ws)]
	$default	reduce using rule 4 (ns)

	ns	go to state 2
	ws	go to state 4

        Rules:
        ------
        0:	$start -> s $end
        1:	s -> /* empty */
        2:	s -> s ws
        3:	s -> s ns
        4:	ns -> /* empty */
        5:	ns -> ns NUM
        6:	ws -> /* empty */
        7:	ws -> ws ID

Execute it with:

   ./typicalrr.pm -d

Try inputs C<4 5>,  C<a b> and C<4 5 a b>.


=head1 SEE ALSO

For a solution to the conflicts
see  correcttypicalrr.eyp and typicalrr_fixed.eyp

=cut

#use base q{RRTail}; 



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;
    my $pos;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      

      /\G(NUM)/gc and return ($1, $1);
      /\G(ID)/gc and return ($1, $1);


      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
      /\G\s*(\S+)/;
      my $near = substr($1,0,10); 

      return($near, $near);

     # die( "Error inside the lexical analyzer near '". $near
     #     ."'. Line: ".$self->line()
     #     .". File: '".$self->YYFilename()."'. No match found.\n");
    }
  }
;


#line 155 ./typicalrr.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@typicalrr::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.182',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 's', '$end' ], 0 ],
  [ 's_1' => 's', [  ], 0 ],
  [ 's_2' => 's', [ 's', 'ws' ], 0 ],
  [ 's_3' => 's', [ 's', 'ns' ], 0 ],
  [ 'ns_4' => 'ns', [  ], 0 ],
  [ 'ns_5' => 'ns', [ 'ns', 'NUM' ], 0 ],
  [ 'ws_6' => 'ws', [  ], 0 ],
  [ 'ws_7' => 'ws', [ 'ws', 'ID' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  's_1' => 1,
  's_2' => 2,
  's_3' => 3,
  'ns_4' => 4,
  'ns_5' => 5,
  'ws_6' => 6,
  'ws_7' => 7,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	ID => { ISSEMANTIC => 1 },
	NUM => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'typicalrr.eyp',
    yystates =>
[
	{#State 0
		DEFAULT => -1,
		GOTOS => {
			's' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'NUM' => -4,
			'ID' => -4,
			'' => 2
		},
		GOTOS => {
			'ws' => 3,
			'ns' => 4
		}
	},
	{#State 2
		DEFAULT => 0
	},
	{#State 3
		ACTIONS => {
			'NUM' => -2,
			'' => -2,
			'ID' => 5
		}
	},
	{#State 4
		ACTIONS => {
			'NUM' => 6,
			'' => -3,
			'ID' => -3
		}
	},
	{#State 5
		DEFAULT => -7
	},
	{#State 6
		DEFAULT => -5
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 244 ./typicalrr.pm
	],
	[#Rule s_1
		 's', 0,
sub {
#line 95 "typicalrr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 251 ./typicalrr.pm
	],
	[#Rule s_2
		 's', 2,
sub {
#line 95 "typicalrr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 258 ./typicalrr.pm
	],
	[#Rule s_3
		 's', 2,
sub {
#line 95 "typicalrr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 265 ./typicalrr.pm
	],
	[#Rule ns_4
		 'ns', 0,
sub {
#line 95 "typicalrr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 272 ./typicalrr.pm
	],
	[#Rule ns_5
		 'ns', 2,
sub {
#line 95 "typicalrr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 279 ./typicalrr.pm
	],
	[#Rule ws_6
		 'ws', 0,
sub {
#line 95 "typicalrr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 286 ./typicalrr.pm
	],
	[#Rule ws_7
		 'ws', 2,
sub {
#line 95 "typicalrr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 293 ./typicalrr.pm
	]
],
#line 296 ./typicalrr.pm
    yybypass       => 0,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {}
,
    yystateconflict => {  },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         's_1', 
         's_2', 
         's_3', 
         'ns_4', 
         'ns_5', 
         'ws_6', 
         'ws_7', );
  $self;
}

#line 114 "typicalrr.eyp"


__PACKAGE__->lexer(
    sub {
      my $parser = shift;
  
      for (${$parser->input()}) {    # contextualize
        m{\G(\s*)}gc;
        $parser->tokenline($1 =~ tr{\n}{});
  
        m{\G([a-z]+)}gc                and return ('ID', $1);
        m{\G([0-9]+)}gc                and return ('NUM', $1);
  
        m{\G(.)}gc                     and return ($1,    $1);
  
        return('',undef);              # EOF
      }
    }
  );


unless (caller()) {
  my $prompt = 'Try inputs "4 5",  "a b" and "4 5 a b"'.
               '(press <CR><CTRL-D> to finish): ';
  __PACKAGE__->main($prompt) 
}



=for None

=cut


#line 356 ./typicalrr.pm



1;
