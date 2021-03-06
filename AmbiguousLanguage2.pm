#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.178.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'AmbiguousLanguage2.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package AmbiguousLanguage2;
use strict;

push @AmbiguousLanguage2::ISA, 'Parse::Eyapp::Driver';




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


#line 60 ./AmbiguousLanguage2.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@AmbiguousLanguage2::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.178',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'st', '$end' ], 0 ],
  [ 'st_is_s' => 'st', [ 'AorC', 's' ], 0 ],
  [ 's_is_aeqb' => 's', [ 'aeqb' ], 0 ],
  [ 's_is_beqc' => 's', [ 'beqc' ], 0 ],
  [ 'aeqb_is_ab_cs' => 'aeqb', [ 'ab', 'cs' ], 0 ],
  [ 'ab_is_empty' => 'ab', [  ], 0 ],
  [ 'ab_is_a_ab_b' => 'ab', [ 'a', 'ab', 'b' ], 0 ],
  [ 'cs_is_empty' => 'cs', [  ], 0 ],
  [ 'cs_is_cs_c' => 'cs', [ 'cs', 'c' ], 0 ],
  [ 'beqc_is_as_bc' => 'beqc', [ 'as', 'bc' ], 0 ],
  [ 'bc_is_empty' => 'bc', [  ], 0 ],
  [ 'bc_is_b_bc_c' => 'bc', [ 'b', 'bc', 'c' ], 0 ],
  [ 'BC' => 'as', [  ], 0 ],
  [ 'as_is_as_a' => 'as', [ 'as', 'a' ], 0 ],
  [ 'AorC' => 'AorC', [  ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'st_is_s' => 1,
  's_is_aeqb' => 2,
  's_is_beqc' => 3,
  'aeqb_is_ab_cs' => 4,
  'ab_is_empty' => 5,
  'ab_is_a_ab_b' => 6,
  'cs_is_empty' => 7,
  'cs_is_cs_c' => 8,
  'beqc_is_as_bc' => 9,
  'bc_is_empty' => 10,
  'bc_is_b_bc_c' => 11,
  'BC' => 12,
  'as_is_as_a' => 13,
  'AorC' => 14,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'a' => { ISSEMANTIC => 0 },
	'b' => { ISSEMANTIC => 0 },
	'c' => { ISSEMANTIC => 0 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'AmbiguousLanguage2.eyp',
    yystates =>
[
	{#State 0
		DEFAULT => -14,
		GOTOS => {
			'AorC' => 1,
			'st' => 2
		}
	},
	{#State 1
		ACTIONS => {
			'' => -5,
			"c" => -5,
			"b" => -12,
			"a" => 6
		},
		GOTOS => {
			'aeqb' => 4,
			'ab' => 3,
			'as' => 5,
			'beqc' => 7,
			's' => 8
		}
	},
	{#State 2
		ACTIONS => {
			'' => 9
		}
	},
	{#State 3
		DEFAULT => -7,
		GOTOS => {
			'cs' => 10
		}
	},
	{#State 4
		DEFAULT => -2
	},
	{#State 5
		ACTIONS => {
			'' => -10,
			"a" => 12,
			"b" => 11
		},
		GOTOS => {
			'bc' => 13
		}
	},
	{#State 6
		ACTIONS => {
			"b" => -5,
			"a" => 6
		},
		GOTOS => {
			'ab' => 14
		}
	},
	{#State 7
		DEFAULT => -3
	},
	{#State 8
		DEFAULT => -1
	},
	{#State 9
		DEFAULT => 0
	},
	{#State 10
		ACTIONS => {
			'' => -4,
			"c" => 15
		}
	},
	{#State 11
		ACTIONS => {
			"c" => -10,
			"b" => 11
		},
		GOTOS => {
			'bc' => 16
		}
	},
	{#State 12
		DEFAULT => -13
	},
	{#State 13
		DEFAULT => -9
	},
	{#State 14
		ACTIONS => {
			"b" => 17
		}
	},
	{#State 15
		DEFAULT => -8
	},
	{#State 16
		ACTIONS => {
			"c" => 18
		}
	},
	{#State 17
		DEFAULT => -6
	},
	{#State 18
		DEFAULT => -11
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 228 ./AmbiguousLanguage2.pm
	],
	[#Rule st_is_s
		 'st', 2,
sub {
#line 0 "AmbiguousLanguage2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 235 ./AmbiguousLanguage2.pm
	],
	[#Rule s_is_aeqb
		 's', 1,
sub {
#line 0 "AmbiguousLanguage2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 242 ./AmbiguousLanguage2.pm
	],
	[#Rule s_is_beqc
		 's', 1,
sub {
#line 0 "AmbiguousLanguage2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 249 ./AmbiguousLanguage2.pm
	],
	[#Rule aeqb_is_ab_cs
		 'aeqb', 2,
sub {
#line 0 "AmbiguousLanguage2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 256 ./AmbiguousLanguage2.pm
	],
	[#Rule ab_is_empty
		 'ab', 0,
sub {
#line 0 "AmbiguousLanguage2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 263 ./AmbiguousLanguage2.pm
	],
	[#Rule ab_is_a_ab_b
		 'ab', 3,
sub {
#line 0 "AmbiguousLanguage2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 270 ./AmbiguousLanguage2.pm
	],
	[#Rule cs_is_empty
		 'cs', 0,
sub {
#line 0 "AmbiguousLanguage2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 277 ./AmbiguousLanguage2.pm
	],
	[#Rule cs_is_cs_c
		 'cs', 2,
sub {
#line 0 "AmbiguousLanguage2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 284 ./AmbiguousLanguage2.pm
	],
	[#Rule beqc_is_as_bc
		 'beqc', 2,
sub {
#line 0 "AmbiguousLanguage2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 291 ./AmbiguousLanguage2.pm
	],
	[#Rule bc_is_empty
		 'bc', 0,
sub {
#line 0 "AmbiguousLanguage2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 298 ./AmbiguousLanguage2.pm
	],
	[#Rule bc_is_b_bc_c
		 'bc', 3,
sub {
#line 0 "AmbiguousLanguage2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 305 ./AmbiguousLanguage2.pm
	],
	[#Rule BC
		 'as', 0,
sub {
#line 0 "AmbiguousLanguage2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 312 ./AmbiguousLanguage2.pm
	],
	[#Rule as_is_as_a
		 'as', 2,
sub {
#line 0 "AmbiguousLanguage2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 319 ./AmbiguousLanguage2.pm
	],
	[#Rule AorC
		 'AorC', 0,
sub {
#line 48 "AmbiguousLanguage2.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 6 "AmbiguousLanguage2.eyp" 
{ $self->YYNestedParse('ab'); }
#line 329 ./AmbiguousLanguage2.pm
  }

}
#line 333 ./AmbiguousLanguage2.pm
	]
],
#line 336 ./AmbiguousLanguage2.pm
    yybypass       => 0,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {
          'AorC' => {
                      'production' => {
                                        '-12' => [
                                                   0
                                                 ],
                                        '-6' => [
                                                  1
                                                ]
                                      },
                      'explorerline' => 6,
                      'codeh' => '  my $self = $_[0];
  for (${$self->input()}) {  
#line 6 "AmbiguousLanguage2.eyp" 
    $self->YYIf(ab, shift, BC);
#line 357 ./AmbiguousLanguage2.pm
  }
',
                      'totalviewpoint' => 1,
                      'states' => [
                                    {
                                      '1' => [
                                               ' ',
                                               'a'
                                             ]
                                    }
                                  ],
                      'total' => 2,
                      'line' => 6
                    }
        }
,
    yystateconflict => { 1 => [                    { 
                      name => 'AorC', 
                      codeh => sub {   my $self = $_[0];
  for (${$self->input()}) {  
#line 6 "AmbiguousLanguage2.eyp" 
    $self->YYIf('ab', 'shift', 'BC');
#line 380 ./AmbiguousLanguage2.pm
  }
 },
                   },
 ], },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'st_is_s', 
         's_is_aeqb', 
         's_is_beqc', 
         'aeqb_is_ab_cs', 
         'ab_is_empty', 
         'ab_is_a_ab_b', 
         'cs_is_empty', 
         'cs_is_cs_c', 
         'beqc_is_as_bc', 
         'bc_is_empty', 
         'bc_is_b_bc_c', 
         'BC', 
         'as_is_as_a', 
         'AorC', );
  $self;
}

#line 48 "AmbiguousLanguage2.eyp"



=for None

=cut


#line 417 ./AmbiguousLanguage2.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
