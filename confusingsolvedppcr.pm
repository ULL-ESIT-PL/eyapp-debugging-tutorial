#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.178.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'confusingsolvedppcr.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package confusingsolvedppcr;
use strict;

push @confusingsolvedppcr::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "confusingsolvedppcr.eyp"


=head1 SYNOPSIS

See the grammar in file C<confusing.eyp> first.

This example illustrates how to solve the conflict using 
the postponed conflict resolution technique.

Compile the grammar with:

                 eyapp -TC confusingsolvedppcr.eyp

and execute it with:

                ./confusingsolvedppcr.pm -t -i -c 'x y c d'
                ./confusingsolvedppcr.pm -t -i -c 'x y c f'


=head1 SEE ALSO
 
=over 2

=item * The grammar in file C<confusing.eyp> 

=item * http://www.cs.man.ac.uk/~pjj/cs2121/ho/node19.html

=cut



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      

      /\G(x)/gc and return ($1, $1);
      /\G(c)/gc and return ($1, $1);
      /\G(d)/gc and return ($1, $1);
      /\G(y)/gc and return ($1, $1);
      /\G(f)/gc and return ($1, $1);


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


#line 95 ./confusingsolvedppcr.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@confusingsolvedppcr::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.178',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'A', '$end' ], 0 ],
  [ 'Bcd' => 'A', [ 'B', 'c', 'd' ], 0 ],
  [ 'Ecf' => 'A', [ 'E', 'c', 'f' ], 0 ],
  [ 'XY:D' => 'B', [ 'x', 'y', 'DORF' ], 0 ],
  [ 'XY:F' => 'E', [ 'x', 'y', 'DORF' ], 0 ],
  [ 'DORF' => 'DORF', [  ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'Bcd' => 1,
  'Ecf' => 2,
  ':D' => 3,
  'XY:D' => 3,
  ':F' => 4,
  'XY:F' => 4,
  'DORF' => 5,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'c' => { ISSEMANTIC => 1 },
	'd' => { ISSEMANTIC => 1 },
	'f' => { ISSEMANTIC => 1 },
	'x' => { ISSEMANTIC => 1 },
	'y' => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'confusingsolvedppcr.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			"x" => 1
		},
		GOTOS => {
			'A' => 2,
			'B' => 4,
			'E' => 3
		}
	},
	{#State 1
		ACTIONS => {
			"y" => 5
		}
	},
	{#State 2
		ACTIONS => {
			'' => 6
		}
	},
	{#State 3
		ACTIONS => {
			"c" => 7
		}
	},
	{#State 4
		ACTIONS => {
			"c" => 8
		}
	},
	{#State 5
		DEFAULT => -5,
		GOTOS => {
			'DORF' => 9
		}
	},
	{#State 6
		DEFAULT => 0
	},
	{#State 7
		ACTIONS => {
			"f" => 10
		}
	},
	{#State 8
		ACTIONS => {
			"d" => 11
		}
	},
	{#State 9
		DEFAULT => -3
	},
	{#State 10
		DEFAULT => -2
	},
	{#State 11
		DEFAULT => -1
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 203 ./confusingsolvedppcr.pm
	],
	[#Rule Bcd
		 'A', 3,
sub {
#line 0 "confusingsolvedppcr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 210 ./confusingsolvedppcr.pm
	],
	[#Rule Ecf
		 'A', 3,
sub {
#line 0 "confusingsolvedppcr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 217 ./confusingsolvedppcr.pm
	],
	[#Rule XY:D
		 'B', 3,
sub {
#line 0 "confusingsolvedppcr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 224 ./confusingsolvedppcr.pm
	],
	[#Rule XY:F
		 'E', 3,
sub {
#line 0 "confusingsolvedppcr.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 231 ./confusingsolvedppcr.pm
	],
	[#Rule DORF
		 'DORF', 0,
sub {
#line 51 "confusingsolvedppcr.eyp"
{   my $self = $_[0];
  for (${$self->input()}) {  
#line 35 "confusingsolvedppcr.eyp" 
{ $self->YYNestedRegexp('\G(?=.*?d)'); }
#line 241 ./confusingsolvedppcr.pm
  }

 }
{   my $self = $_[0];
  for (${$self->input()}) {  
#line 35 "confusingsolvedppcr.eyp" 
    $self->YYIf('.regexp', 'XY:D', 'XY:F');
#line 249 ./confusingsolvedppcr.pm
  }
 }}
#line 252 ./confusingsolvedppcr.pm
	]
],
#line 255 ./confusingsolvedppcr.pm
    yybypass       => 0,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {
          'DORF' => {
                      'production' => {
                                        '-4' => [
                                                  2
                                                ],
                                        '-3' => [
                                                  2
                                                ]
                                      },
                      'explorerline' => 35,
                      'states' => [
                                    {
                                      '9' => [
                                               'c'
                                             ]
                                    }
                                  ],
                      'total' => 2,
                      'line' => 35
                    }
        }
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'Bcd', 
         'Ecf', 
         'XY:D', 
         'XY:F', 
         'DORF', );
  $self;
}

#line 51 "confusingsolvedppcr.eyp"




=for None

=cut


#line 308 ./confusingsolvedppcr.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
