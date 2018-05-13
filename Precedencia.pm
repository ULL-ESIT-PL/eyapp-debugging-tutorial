#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'Precedencia.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package Precedencia;
use strict;

push @Precedencia::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "Precedencia.eyp"

=head1 SYNOPSIS

Be sure Math::Tail in examples/Calculator/lib is reachable
compile it with 

  eyapp -C Precedencia.eyp 

execute the generated modulino with:

      ./Precedencia.pm -noslurp -c '2@3@4' -info  --margin 2

or:
      ./Precedencia.pm --debug --noslurp -c '2@3@4' -info  --margin 2

Try also with inputs:
   
    4@3@5
    4@3&5
    4&3@5
    4&3&5

The result will be the term describing the generated
Abstract Syntax Tree 

=head1 See also

    http://search.cpan.org/perldoc?Parse::Eyapp::debuggingtut

=cut

our $VERSION = '0.02';



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;
    my $pos;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(\n|\@|\&)}gc and return ($1, $1);

      /\G\d+/gc and return ('NUM', $1);


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


#line 96 ./Precedencia.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@Precedencia::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.182',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'list', '$end' ], 0 ],
  [ 'list_1' => 'list', [  ], 0 ],
  [ 'list_2' => 'list', [ 'list', '\n' ], 0 ],
  [ 'list_3' => 'list', [ 'list', 'e' ], 0 ],
  [ 'NUM' => 'e', [ 'NUM' ], 0 ],
  [ 'AMPERSAND' => 'e', [ 'e', '&', 'e' ], 0 ],
  [ 'AT' => 'e', [ 'e', '@', 'e' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'list_1' => 1,
  'list_2' => 2,
  'list_3' => 3,
  'NUM' => 4,
  'AMPERSAND' => 5,
  'AT' => 6,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'&' => { ISSEMANTIC => 0 },
	'@' => { ISSEMANTIC => 0 },
	'\n' => { ISSEMANTIC => 0 },
	NUM => { ISSEMANTIC => 1 },
	dummy => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'Precedencia.eyp',
    yystates =>
[
	{#State 0
		DEFAULT => -1,
		GOTOS => {
			'list' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'NUM' => 4,
			'' => 5,
			"\n" => 2
		},
		GOTOS => {
			'e' => 3
		}
	},
	{#State 2
		DEFAULT => -2
	},
	{#State 3
		ACTIONS => {
			"&" => 6,
			"\@" => 7
		},
		DEFAULT => -3
	},
	{#State 4
		DEFAULT => -4
	},
	{#State 5
		DEFAULT => 0
	},
	{#State 6
		ACTIONS => {
			'NUM' => 4
		},
		GOTOS => {
			'e' => 8
		}
	},
	{#State 7
		ACTIONS => {
			'NUM' => 4
		},
		GOTOS => {
			'e' => 9
		}
	},
	{#State 8
		ACTIONS => {
			"&" => 6
		},
		DEFAULT => -5
	},
	{#State 9
		ACTIONS => {
			"&" => 6
		},
		DEFAULT => -6
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 206 ./Precedencia.pm
	],
	[#Rule list_1
		 'list', 0,
sub {
#line 40 "Precedencia.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 213 ./Precedencia.pm
	],
	[#Rule list_2
		 'list', 2,
sub {
#line 44 "Precedencia.eyp"
}
#line 220 ./Precedencia.pm
	],
	[#Rule list_3
		 'list', 2,
sub {
#line 45 "Precedencia.eyp"
my $list = $_[1]; my $e = $_[2];  print $e->str."\n"; 
                 $e->png(); 
                 $e; 
               }
#line 230 ./Precedencia.pm
	],
	[#Rule NUM
		 'e', 1,
sub {
#line 40 "Precedencia.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 237 ./Precedencia.pm
	],
	[#Rule AMPERSAND
		 'e', 3,
sub {
#line 40 "Precedencia.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 244 ./Precedencia.pm
	],
	[#Rule AT
		 'e', 3,
sub {
#line 40 "Precedencia.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 251 ./Precedencia.pm
	]
],
#line 254 ./Precedencia.pm
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
         'list_1', 
         'list_2', 
         'list_3', 
         'NUM', 
         'AMPERSAND', 
         'AT', );
  $self;
}

#line 59 "Precedencia.eyp"


# We can explicit a lexer if we want:

__PACKAGE__->lexer(
    sub {
      my $parser = shift;
  
      for (${$parser->input()}) {    # contextualize
        m{\G(\s*)}gc;
        $parser->tokenline($1 =~ tr{\n}{});
  
        m{\G([0-9]+)}gc                and return ('NUM', $1);
  
        m{\G(.)}gc                     and return ($1,    $1);
  
        return('',undef);              # EOF
      }
    }
  );

# __PACKAGE__->main('Input (try st. like 2@3&4<CR><CTRL-D>): ') unless caller();

1;


=for None

=cut


#line 310 ./Precedencia.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
