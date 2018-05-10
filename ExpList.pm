########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.178.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'ExpList.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package ExpList;
use strict;

push @ExpList::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      

      /\G(\d+)/gc and return ('NUM', $1);
      /\G([-+*\/])/gc and return ('OP', $1);


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


#line 62 ./ExpList.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@ExpList::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.178',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'T', '$end' ], 0 ],
  [ 'T_1' => 'T', [ 'S' ], 0 ],
  [ 'S_2' => 'S', [ 'S', 'x' ], 0 ],
  [ 'S_3' => 'S', [ 'x' ], 0 ],
  [ 'x_4' => 'x', [ 'NUM' ], 0 ],
  [ 'x_5' => 'x', [ 'x', 'OP', 'NUM' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'T_1' => 1,
  'S_2' => 2,
  'S_3' => 3,
  'x_4' => 4,
  'x_5' => 5,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	NUM => { ISSEMANTIC => 1 },
	OP => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'ExpList.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'NUM' => 1
		},
		GOTOS => {
			'S' => 2,
			'T' => 3,
			'x' => 4
		}
	},
	{#State 1
		DEFAULT => -4
	},
	{#State 2
		ACTIONS => {
			'NUM' => 1
		},
		DEFAULT => -1,
		GOTOS => {
			'x' => 5
		}
	},
	{#State 3
		DEFAULT => 6
	},
	{#State 4
		ACTIONS => {
			'OP' => 7
		},
		DEFAULT => -3
	},
	{#State 5
		ACTIONS => {
			'OP' => 7
		},
		DEFAULT => -2
	},
	{#State 6
		DEFAULT => 0
	},
	{#State 7
		ACTIONS => {
			'NUM' => 8
		}
	},
	{#State 8
		DEFAULT => -5
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 155 ./ExpList.pm
	],
	[#Rule T_1
		 'T', 1,
sub {
#line 6 "ExpList.eyp"
my $S = $_[1];  1+int($S/2) }
#line 162 ./ExpList.pm
	],
	[#Rule S_2
		 'S', 2,
sub {
#line 10 "ExpList.eyp"
my $S = $_[1];  $S + 1 }
#line 169 ./ExpList.pm
	],
	[#Rule S_3
		 'S', 1,
sub {
#line 11 "ExpList.eyp"
 1 }
#line 176 ./ExpList.pm
	],
	[#Rule x_4
		 'x', 1, undef
#line 180 ./ExpList.pm
	],
	[#Rule x_5
		 'x', 3, undef
#line 184 ./ExpList.pm
	]
],
#line 187 ./ExpList.pm
    yybypass       => 0,
    yybuildingtree => 0,
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
         'T_1', 
         'S_2', 
         'S_3', 
         'x_4', 
         'x_5', );
  $self;
}

#line 18 "ExpList.eyp"





=for None

=cut


#line 221 ./ExpList.pm



1;
