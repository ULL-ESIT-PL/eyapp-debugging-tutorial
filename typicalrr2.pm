#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'typicalrr2.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package typicalrr2;
use strict;

push @typicalrr2::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "typicalrr2.eyp"


=head1 SYNOPSIS

The main difference between this example and C<typicalrr.eyp>
is that the rules for C<ws> and C<ns> have been changed to
be right recursives

Compile it with 

            eyapp -b '' typicalrr2

Execute it with:

   ./typicalrr2.pm -d -t

Try inputs C<4 5>,  C<a b> and C<4 5 a b>.


=head1 SEE ALSO

see  typicalrr.eyp, correcttypicalrr.eyp and typicalrr_fixed.eyp

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


#line 91 ./typicalrr2.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@typicalrr2::ISA variable inside the header section of the eyapp program?
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
  [ 'EMPTY' => 's', [  ], 0 ],
  [ 'LIST' => 's', [ 's', 'ws' ], 0 ],
  [ 'LIST' => 's', [ 's', 'ns' ], 0 ],
  [ 'EMPTYNUM' => 'ns', [  ], 0 ],
  [ 'NUMS' => 'ns', [ 'NUM', 'ns' ], 0 ],
  [ 'EMPTYID' => 'ws', [  ], 0 ],
  [ 'IDS' => 'ws', [ 'ID', 'ws' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'EMPTY' => 1,
  'LIST' => 2,
  'LIST' => 3,
  'EMPTYNUM' => 4,
  'NUMS' => 5,
  'EMPTYID' => 6,
  'IDS' => 7,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	ID => { ISSEMANTIC => 1 },
	NUM => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'typicalrr2.eyp',
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
			'' => 2,
			'ID' => 3,
			'NUM' => 4
		},
		GOTOS => {
			'ns' => 6,
			'ws' => 5
		}
	},
	{#State 2
		DEFAULT => 0
	},
	{#State 3
		ACTIONS => {
			'ID' => 3
		},
		DEFAULT => -6,
		GOTOS => {
			'ws' => 7
		}
	},
	{#State 4
		ACTIONS => {
			'NUM' => 4
		},
		DEFAULT => -4,
		GOTOS => {
			'ns' => 8
		}
	},
	{#State 5
		DEFAULT => -2
	},
	{#State 6
		DEFAULT => -3
	},
	{#State 7
		DEFAULT => -7
	},
	{#State 8
		DEFAULT => -5
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 190 ./typicalrr2.pm
	],
	[#Rule EMPTY
		 's', 0,
sub {
#line 31 "typicalrr2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 197 ./typicalrr2.pm
	],
	[#Rule LIST
		 's', 2,
sub {
#line 31 "typicalrr2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 204 ./typicalrr2.pm
	],
	[#Rule LIST
		 's', 2,
sub {
#line 31 "typicalrr2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 211 ./typicalrr2.pm
	],
	[#Rule EMPTYNUM
		 'ns', 0,
sub {
#line 31 "typicalrr2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 218 ./typicalrr2.pm
	],
	[#Rule NUMS
		 'ns', 2,
sub {
#line 31 "typicalrr2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 225 ./typicalrr2.pm
	],
	[#Rule EMPTYID
		 'ws', 0,
sub {
#line 31 "typicalrr2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 232 ./typicalrr2.pm
	],
	[#Rule IDS
		 'ws', 2,
sub {
#line 31 "typicalrr2.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 239 ./typicalrr2.pm
	]
],
#line 242 ./typicalrr2.pm
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
         'EMPTY', 
         'LIST', 
         'LIST', 
         'EMPTYNUM', 
         'NUMS', 
         'EMPTYID', 
         'IDS', );
  $self;
}

#line 57 "typicalrr2.eyp"


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
  my $prompt = 'Try "4 5 a b 2 3" '.
               '(press <CR><CTRL-D> to finish): ';
  __PACKAGE__->main($prompt) 
}



=for None

=cut


#line 302 ./typicalrr2.pm



1;
