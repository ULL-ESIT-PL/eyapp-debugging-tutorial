########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.178.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'abC.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package abC;
use strict;

push @abC::ISA, 'Parse::Eyapp::Driver';




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

      m{\G(c|a|b)}gc and return ($1, $1);

      /\G\Z/gc and return ('D', $1);


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


#line 61 ./abC.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@abC::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.178',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'abC', '$end' ], 0 ],
  [ 'abC_1' => 'abC', [ 'ab', 'c' ], 0 ],
  [ 'abC_2' => 'abC', [ 'ab', 'D' ], 0 ],
  [ 'ab_3' => 'ab', [  ], 0 ],
  [ 'ab_4' => 'ab', [ 'a', 'ab', 'b' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'abC_1' => 1,
  'abC_2' => 2,
  'ab_3' => 3,
  'ab_4' => 4,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'a' => { ISSEMANTIC => 0 },
	'b' => { ISSEMANTIC => 0 },
	'c' => { ISSEMANTIC => 0 },
	D => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'abC.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			"a" => 2
		},
		DEFAULT => -3,
		GOTOS => {
			'ab' => 1,
			'abC' => 3
		}
	},
	{#State 1
		ACTIONS => {
			"c" => 4,
			'D' => 5
		}
	},
	{#State 2
		ACTIONS => {
			"a" => 2
		},
		DEFAULT => -3,
		GOTOS => {
			'ab' => 6
		}
	},
	{#State 3
		DEFAULT => 7
	},
	{#State 4
		DEFAULT => -1
	},
	{#State 5
		DEFAULT => -2
	},
	{#State 6
		ACTIONS => {
			"b" => 8
		}
	},
	{#State 7
		DEFAULT => 0
	},
	{#State 8
		DEFAULT => -4
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 151 ./abC.pm
	],
	[#Rule abC_1
		 'abC', 2, undef
#line 155 ./abC.pm
	],
	[#Rule abC_2
		 'abC', 2, undef
#line 159 ./abC.pm
	],
	[#Rule ab_3
		 'ab', 0, undef
#line 163 ./abC.pm
	],
	[#Rule ab_4
		 'ab', 3, undef
#line 167 ./abC.pm
	]
],
#line 170 ./abC.pm
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
         'abC_1', 
         'abC_2', 
         'ab_3', 
         'ab_4', );
  $self;
}

#line 11 "abC.eyp"




=for None

=cut


#line 202 ./abC.pm



1;
