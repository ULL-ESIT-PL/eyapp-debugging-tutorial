########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.177.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'Assign.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package Assign;
use strict;

push @Assign::ISA, 'Parse::Eyapp::Driver';




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

      m{\G(\=)}gc and return ($1, $1);

      /\G[a-zA-Z_]\w*/gc and return ('ID', $1);


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


#line 61 ./Assign.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@Assign::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.177',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'assignstmt', '$end' ], 0 ],
  [ 'assignstmt_1' => 'assignstmt', [ 'id', '=', 'expr' ], 0 ],
  [ 'expr_2' => 'expr', [ 'id', '=', 'id' ], 0 ],
  [ 'expr_3' => 'expr', [ 'id' ], 0 ],
  [ 'id_4' => 'id', [ 'ID' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'assignstmt_1' => 1,
  'expr_2' => 2,
  'expr_3' => 3,
  'id_4' => 4,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'=' => { ISSEMANTIC => 0 },
	ID => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'Assign.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'ID' => 1
		},
		GOTOS => {
			'assignstmt' => 2,
			'id' => 3
		}
	},
	{#State 1
		DEFAULT => -4
	},
	{#State 2
		DEFAULT => 4
	},
	{#State 3
		ACTIONS => {
			"=" => 5
		}
	},
	{#State 4
		DEFAULT => 0
	},
	{#State 5
		ACTIONS => {
			'ID' => 1
		},
		GOTOS => {
			'expr' => 6,
			'id' => 7
		}
	},
	{#State 6
		DEFAULT => -1
	},
	{#State 7
		ACTIONS => {
			"=" => 8
		},
		DEFAULT => -3
	},
	{#State 8
		ACTIONS => {
			'ID' => 1
		},
		GOTOS => {
			'id' => 9
		}
	},
	{#State 9
		DEFAULT => -2
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 156 ./Assign.pm
	],
	[#Rule assignstmt_1
		 'assignstmt', 3, undef
#line 160 ./Assign.pm
	],
	[#Rule expr_2
		 'expr', 3, undef
#line 164 ./Assign.pm
	],
	[#Rule expr_3
		 'expr', 1, undef
#line 168 ./Assign.pm
	],
	[#Rule id_4
		 'id', 1, undef
#line 172 ./Assign.pm
	]
],
#line 175 ./Assign.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {}
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'assignstmt_1', 
         'expr_2', 
         'expr_3', 
         'id_4', );
  $self;
}

#line 17 "Assign.eyp"



=for None

=cut


#line 205 ./Assign.pm



1;
