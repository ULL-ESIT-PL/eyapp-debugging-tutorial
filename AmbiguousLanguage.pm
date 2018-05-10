########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.178.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'AmbiguousLanguage.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package AmbiguousLanguage;
use strict;

push @AmbiguousLanguage::ISA, 'Parse::Eyapp::Driver';




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


#line 60 ./AmbiguousLanguage.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@AmbiguousLanguage::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.178',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 's', '$end' ], 0 ],
  [ 's_1' => 's', [ 'aeqb' ], 0 ],
  [ 's_2' => 's', [ 'beqc' ], 0 ],
  [ 'aeqb_3' => 'aeqb', [ 'ab', 'cs' ], 0 ],
  [ 'ab_4' => 'ab', [  ], 0 ],
  [ 'ab_5' => 'ab', [ 'a', 'ab', 'b' ], 0 ],
  [ 'cs_6' => 'cs', [  ], 0 ],
  [ 'cs_7' => 'cs', [ 'cs', 'c' ], 0 ],
  [ 'beqc_8' => 'beqc', [ 'as', 'bc' ], 0 ],
  [ 'bc_9' => 'bc', [  ], 0 ],
  [ 'bc_10' => 'bc', [ 'b', 'bc', 'c' ], 0 ],
  [ 'as_11' => 'as', [  ], 0 ],
  [ 'as_12' => 'as', [ 'as', 'a' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  's_1' => 1,
  's_2' => 2,
  'aeqb_3' => 3,
  'ab_4' => 4,
  'ab_5' => 5,
  'cs_6' => 6,
  'cs_7' => 7,
  'beqc_8' => 8,
  'bc_9' => 9,
  'bc_10' => 10,
  'as_11' => 11,
  'as_12' => 12,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'a' => { ISSEMANTIC => 0 },
	'b' => { ISSEMANTIC => 0 },
	'c' => { ISSEMANTIC => 0 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'AmbiguousLanguage.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'' => -4,
			"c" => -4,
			"b" => -11,
			"a" => 4
		},
		GOTOS => {
			'aeqb' => 2,
			'ab' => 1,
			'as' => 3,
			'beqc' => 5,
			's' => 6
		}
	},
	{#State 1
		DEFAULT => -6,
		GOTOS => {
			'cs' => 7
		}
	},
	{#State 2
		DEFAULT => -1
	},
	{#State 3
		ACTIONS => {
			'' => -9,
			"a" => 9,
			"b" => 8
		},
		GOTOS => {
			'bc' => 10
		}
	},
	{#State 4
		ACTIONS => {
			"b" => -4,
			"a" => 4
		},
		GOTOS => {
			'ab' => 11
		}
	},
	{#State 5
		DEFAULT => -2
	},
	{#State 6
		ACTIONS => {
			'' => 12
		}
	},
	{#State 7
		ACTIONS => {
			'' => -3,
			"c" => 13
		}
	},
	{#State 8
		ACTIONS => {
			"c" => -9,
			"b" => 8
		},
		GOTOS => {
			'bc' => 14
		}
	},
	{#State 9
		DEFAULT => -12
	},
	{#State 10
		DEFAULT => -8
	},
	{#State 11
		ACTIONS => {
			"b" => 15
		}
	},
	{#State 12
		DEFAULT => 0
	},
	{#State 13
		DEFAULT => -7
	},
	{#State 14
		ACTIONS => {
			"c" => 16
		}
	},
	{#State 15
		DEFAULT => -5
	},
	{#State 16
		DEFAULT => -10
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 214 ./AmbiguousLanguage.pm
	],
	[#Rule s_1
		 's', 1, undef
#line 218 ./AmbiguousLanguage.pm
	],
	[#Rule s_2
		 's', 1, undef
#line 222 ./AmbiguousLanguage.pm
	],
	[#Rule aeqb_3
		 'aeqb', 2, undef
#line 226 ./AmbiguousLanguage.pm
	],
	[#Rule ab_4
		 'ab', 0, undef
#line 230 ./AmbiguousLanguage.pm
	],
	[#Rule ab_5
		 'ab', 3, undef
#line 234 ./AmbiguousLanguage.pm
	],
	[#Rule cs_6
		 'cs', 0, undef
#line 238 ./AmbiguousLanguage.pm
	],
	[#Rule cs_7
		 'cs', 2, undef
#line 242 ./AmbiguousLanguage.pm
	],
	[#Rule beqc_8
		 'beqc', 2, undef
#line 246 ./AmbiguousLanguage.pm
	],
	[#Rule bc_9
		 'bc', 0, undef
#line 250 ./AmbiguousLanguage.pm
	],
	[#Rule bc_10
		 'bc', 3, undef
#line 254 ./AmbiguousLanguage.pm
	],
	[#Rule as_11
		 'as', 0, undef
#line 258 ./AmbiguousLanguage.pm
	],
	[#Rule as_12
		 'as', 2, undef
#line 262 ./AmbiguousLanguage.pm
	]
],
#line 265 ./AmbiguousLanguage.pm
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
         's_1', 
         's_2', 
         'aeqb_3', 
         'ab_4', 
         'ab_5', 
         'cs_6', 
         'cs_7', 
         'beqc_8', 
         'bc_9', 
         'bc_10', 
         'as_11', 
         'as_12', );
  $self;
}

#line 23 "AmbiguousLanguage.eyp"



=for None

=cut


#line 303 ./AmbiguousLanguage.pm



1;
