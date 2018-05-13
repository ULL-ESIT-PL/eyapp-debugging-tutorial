#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'typicalrr_fixed.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package typicalrr_fixed;
use strict;

push @typicalrr_fixed::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "typicalrr_fixed.eyp"

=head1 SYNOPIS

=head1 SYNOPSIS

Compile it with 

            eyapp -b '' typicalrr_fixed

Execute it with:

   ./typicalrr_fixed.pm -debug -t

Try inputs C<4 5>,  C<a b> and C<4 5 a b>.

=head1 SEE ALSO

see  typicalrr.eyp, typicalrr2.eyp and correcttypicalrr.eyp 

=cut

#use base q{RRTail}; 
#use base q{DebugTail}; 



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;
    my $pos;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(NUM|ID)}gc and return ($1, $1);



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


#line 86 ./typicalrr_fixed.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@typicalrr_fixed::ISA variable inside the header section of the eyapp program?
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
  [ 'ID' => 'ws', [ 'ID' ], 0 ],
  [ 'IDS' => 'ws', [ 'ws', 'ID' ], 0 ],
  [ 'NUM' => 'ns', [ 'NUM' ], 0 ],
  [ 'NUMS' => 'ns', [ 'ns', 'NUM' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'EMPTY' => 1,
  'LIST' => 2,
  'LIST' => 3,
  'ID' => 4,
  'IDS' => 5,
  'NUM' => 6,
  'NUMS' => 7,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	ID => { ISSEMANTIC => 1 },
	NUM => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'typicalrr_fixed.eyp',
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
			'ID' => 2,
			'NUM' => 3,
			'' => 5
		},
		GOTOS => {
			'ws' => 4,
			'ns' => 6
		}
	},
	{#State 2
		DEFAULT => -4
	},
	{#State 3
		DEFAULT => -6
	},
	{#State 4
		ACTIONS => {
			'ID' => 7
		},
		DEFAULT => -2
	},
	{#State 5
		DEFAULT => 0
	},
	{#State 6
		ACTIONS => {
			'NUM' => 8
		},
		DEFAULT => -3
	},
	{#State 7
		DEFAULT => -5
	},
	{#State 8
		DEFAULT => -7
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 179 ./typicalrr_fixed.pm
	],
	[#Rule EMPTY
		 's', 0,
sub {
#line 28 "typicalrr_fixed.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 186 ./typicalrr_fixed.pm
	],
	[#Rule LIST
		 's', 2,
sub {
#line 28 "typicalrr_fixed.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 193 ./typicalrr_fixed.pm
	],
	[#Rule LIST
		 's', 2,
sub {
#line 28 "typicalrr_fixed.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 200 ./typicalrr_fixed.pm
	],
	[#Rule ID
		 'ws', 1,
sub {
#line 28 "typicalrr_fixed.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 207 ./typicalrr_fixed.pm
	],
	[#Rule IDS
		 'ws', 2,
sub {
#line 28 "typicalrr_fixed.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 214 ./typicalrr_fixed.pm
	],
	[#Rule NUM
		 'ns', 1,
sub {
#line 28 "typicalrr_fixed.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 221 ./typicalrr_fixed.pm
	],
	[#Rule NUMS
		 'ns', 2,
sub {
#line 28 "typicalrr_fixed.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 228 ./typicalrr_fixed.pm
	]
],
#line 231 ./typicalrr_fixed.pm
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
         'ID', 
         'IDS', 
         'NUM', 
         'NUMS', );
  $self;
}

#line 54 "typicalrr_fixed.eyp"


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
  $Parse::Eyapp::Node::INDENT = 1;
  my $prompt = 'Try "4 5 a b 2 3" '.
               '(press <CR><CTRL-D> to finish): ';
  __PACKAGE__->main($prompt) 
}



=for None

=cut


#line 291 ./typicalrr_fixed.pm



1;
