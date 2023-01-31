\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dnd-tools}

%%%%%%%%%% USER OPTIONS FOR CLASS %%%%%%%%%%

%%%%%%%%%% MAIN OPTIONS TO CLASS %%%%%%%%%%
\LoadClass{article}

%%%%%%%%%% PACKAGES %%%%%%%%%%

% -------- geometry --------
\RequirePackage{geometry}

% -------- fonts --------
\RequirePackage[default,scale=0.95]{roboto}
\RequirePackage{fontspec}

\setmainfont{Roboto}
\setsansfont{Mrs Eaves}      % for titles

% -------- typesetting --------
\RequirePackage{microtype}

% -------- formatting --------
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage[many]{tcolorbox}
\usepackage{amssymb}

% -------- tools --------
\RequirePackage{xifthen}
\RequirePackage{luacode}
\RequirePackage{pgffor}
\RequirePackage{xstring}

\luadirect{luatools = require("dnd-tools")}
\newcommand\getDataFromJSON[1][]{%
    \luadirect{luatools.getJSONdata(#1)}%
}

% -------- colors --------
\RequirePackage{xcolor}

\definecolor{artificerColor}{RGB}{85, 0, 85}    % dark eggplant
\definecolor{paladinColor}{RGB}{0, 85, 85}      % dark turquoise
\definecolor{clericColor}{RGB}{163, 113, 0}     % dark goldenrod
\definecolor{bardColor}{RGB}{195, 0, 87}        % dark pink
\definecolor{druidColor}{RGB}{65, 87, 27}       % dark olive green
\definecolor{wizardColor}{RGB}{0, 0, 92}        % dark blue
\definecolor{sorcererColor}{RGB}{100, 0, 0}     % dark red
\definecolor{warlockColor}{RGB}{55, 0, 110}     % dark indigo
\definecolor{rangerColor}{RGB}{0, 75, 0}        % dark green

\definecolor{darkred}{RGB}{100, 0, 0}     % dark red

%%%%%%%%%% VARBIABLES %%%%%%%%%%

% -------- general internal --------

\newcommand{\@page}{\relax}
\newcommand{\page}[1]{\gdef\@page{#1}}

\newcommand{\@filterBySource}{\relax}
\newcommand{\filterBySource}[1]{\gdef\@filterBySource{#1}}

\newcommand{\@texmultiline}{\relax}
\newcommand{\texmultiline}[1]{\gdef\@texmultiline{#1}}

\newcommand{\@textwosided}{\relax}
\newcommand{\textwosided}[1]{\gdef\@textwosided{#1}}

% -------- spell card user input --------

\newcommand{\@classvar}{\relax}
\newcommand{\class}[1]{\edef\@classvar{#1}}

\newcommand{\@archetype}{\relax}
\newcommand{\archetype}[1]{\gdef\@archetype{#1}}

%\newcommand{\@spellLevel}{\relax}
%\newcommand{\spellLevel}[1]{\gdef\@spellLevel{#1}}

% -------- spell card internal --------

\newcommand{\@cardColor}{\relax}
\newcommand{\cardColor}[1]{\gdef\@cardColor{#1}}

\newcommand{\@cardName}{\relax}
\newcommand{\cardName}[1]{\gdef\@cardName{#1}}

\newcommand{\@castingTime}{\relax}
\newcommand{\castingTime}[1]{\gdef\@castingTime{#1}}

\newcommand{\@range}{\relax}
\newcommand{\range}[1]{\gdef\@range{#1}}

\newcommand{\@components}{\relax}
\newcommand{\components}[1]{\gdef\@components{#1}}

\newcommand{\@duration}{\relax}
\newcommand{\duration}[1]{\gdef\@duration{#1}}

\newcommand{\@concentration}{\relax}
\newcommand{\concentration}[1]{\gdef\@concentration{#1}}

\newcommand{\@ritual}{\relax}
\newcommand{\ritual}[1]{\gdef\@ritual{#1}}

\newcommand{\@materials}{\relax}
\newcommand{\materials}[1]{\gdef\@materials{#1}}

\newcommand{\@descript}{\relax}
\newcommand{\descript}[1]{\gdef\@descript{#1}}

\newcommand{\@higherlevels}{\relax}
\newcommand{\higherlevels}[1]{\gdef\@higherlevels{#1}}

\newcommand{\@spellClasses}{\relax}
\newcommand{\spellClasses}[1]{\gdef\@spellClasses{#1}}

\newcommand{\@level}{\relax}
\newcommand{\level}[1]{%
    \ifthenelse{\equal{#1}{0}}{\gdef\@level{Cantrip}}{\gdef\@level{Level #1}}}

\newcommand{\@school}{\relax}
\newcommand{\school}[1]{\gdef\@school{#1}}

% -------- infusion card internal --------

\newcommand{\@prerequisite}{\relax}
\newcommand{\prerequisite}[1]{\gdef\@prerequisite{#1}}

\newcommand{\@nonmagicitem}{\relax}
\newcommand{\nonmagicitem}[1]{\gdef\@nonmagicitem{#1}}

\newcommand{\@requiresattunement}{\relax}
\newcommand{\requiresattunement}[1]{\gdef\@requiresattunement{#1}}

% -------- monster card internal --------

\newcommand{\@monsterName}{\relax}
\newcommand{\monsterName}[1]{\gdef\@monsterName{#1}}

\newcommand{\@size}{\relax}
\newcommand{\size}[1]{\gdef\@size{#1}}

\newcommand{\@alignment}{\relax}
\newcommand{\alignment}[1]{\gdef\@alignment{#1}}

\newcommand{\@type}{\relax}
\newcommand{\type}[1]{\gdef\@type{#1}}
\newcommand{\@subtype}{\relax}
\newcommand{\subtype}[1]{\gdef\@subtype{#1}}

\newcommand{\@armorClass}{\relax}
\newcommand{\armorClass}[1]{\gdef\@armorClass{#1}}
\newcommand{\@armorDesc}{\relax}
\newcommand{\armorDesc}[1]{\gdef\@armorDesc{#1}}

\newcommand{\@hitPoints}{\relax}
\newcommand{\hitPoints}[1]{\gdef\@hitPoints{#1}}
\newcommand{\@hitDice}{\relax}
\newcommand{\hitDice}[1]{\gdef\@hitDice{#1}}

\newcommand{\@speed}{\relax}
\newcommand{\speed}[1]{\gdef\@speed{#1}}
\newcommand{\@walkSpeed}{\relax}
\newcommand{\walkSpeed}[1]{\gdef\@walkSpeed{#1}}
\newcommand{\@flySpeed}{\relax}
\newcommand{\flySpeed}[1]{\gdef\@flySpeed{#1}}
\newcommand{\@swimSpeed}{\relax}
\newcommand{\swimSpeed}[1]{\gdef\@swimSpeed{#1}}

\newcommand{\@STR}{\relax}
\newcommand{\@STRmod}{\relax}
\newcommand{\STR}[1]{\gdef\@STR{#1} \gdef\@STRmod{\luadirect{tex.sprint((#1 - 10)//2)}}}
\newcommand{\@DEX}{\relax}
\newcommand{\@DEXmod}{\relax}
\newcommand{\DEX}[1]{\gdef\@DEX{#1} \gdef\@DEXmod{\luadirect{tex.sprint((#1 - 10)//2)}}}
\newcommand{\@CON}{\relax}
\newcommand{\@CONmod}{\relax}
\newcommand{\CON}[1]{\gdef\@CON{#1} \gdef\@CONmod{\luadirect{tex.sprint((#1 - 10)//2)}}}
\newcommand{\@INT}{\relax}
\newcommand{\@INTmod}{\relax}
\newcommand{\INT}[1]{\gdef\@INT{#1} \gdef\@INTmod{\luadirect{tex.sprint((#1 - 10)//2)}}}
\newcommand{\@WIS}{\relax}
\newcommand{\@WISmod}{\relax}
\newcommand{\WIS}[1]{\gdef\@WIS{#1} \gdef\@WISmod{\luadirect{tex.sprint((#1 - 10)//2)}}}
\newcommand{\@CHA}{\relax}
\newcommand{\@CHAmod}{\relax}
\newcommand{\CHA}[1]{\gdef\@CHA{#1} \gdef\@CHAmod{\luadirect{tex.sprint((#1 - 10)//2)}}}

\newcommand{\printMod}[1]{%
    \ifnum #1<0 #1%
    \else +#1%
    \fi%
}%

\newcommand{\@STRsave}{\relax}
\newcommand{\STRsave}[1]{\gdef\@STRsave{#1}}
\newcommand{\@DEXsave}{\relax}
\newcommand{\DEXsave}[1]{\gdef\@DEXsave{#1}}
\newcommand{\@CONsave}{\relax}
\newcommand{\CONsave}[1]{\gdef\@CONsave{#1}}
\newcommand{\@INTsave}{\relax}
\newcommand{\INTsave}[1]{\gdef\@INTsave{#1}}
\newcommand{\@WISsave}{\relax}
\newcommand{\WISsave}[1]{\gdef\@WISsave{#1}}
\newcommand{\@CHAsave}{\relax}
\newcommand{\CHAsave}[1]{\gdef\@CHAsave{#1}}

\newcommand{\@savingthrows}{\relax}
\newcommand{\collectSaves}{\gdef\@savingthrows{
    \ifthenelse{\equal{\expandafter\@STRsave}{}}{}{Str +\@STRsave~}%
    \ifthenelse{\equal{\expandafter\@DEXsave}{}}{}{Dex +\@DEXsave~}%
    \ifthenelse{\equal{\expandafter\@CONsave}{}}{}{Con +\@CONsave~}%
    \ifthenelse{\equal{\expandafter\@INTsave}{}}{}{Int +\@INTsave~}%
    \ifthenelse{\equal{\expandafter\@WISsave}{}}{}{Wis +\@WISsave~}%
    \ifthenelse{\equal{\expandafter\@CHAsave}{}}{}{Cha +\@CHAsave~}}}%

\newcommand{\@acrobatics}{\relax}
\newcommand{\acrobatics}[1]{\gdef\@acrobatics{#1}}
\newcommand{\@animalhandling}{\relax}
\newcommand{\animalhandling}[1]{\gdef\@animalhandling{#1}}
\newcommand{\@arcana}{\relax}
\newcommand{\arcana}[1]{\gdef\@arcana{#1}}
\newcommand{\@athletics}{\relax}
\newcommand{\athletics}[1]{\gdef\@athletics{#1}}
\newcommand{\@deception}{\relax}
\newcommand{\deception}[1]{\gdef\@deception{#1}}
\newcommand{\@history}{\relax}
\newcommand{\history}[1]{\gdef\@history{#1}}
\newcommand{\@insight}{\relax}
\newcommand{\insight}[1]{\gdef\@insight{#1}}
\newcommand{\@intimidation}{\relax}
\newcommand{\intimidation}[1]{\gdef\@intimidation{#1}}
\newcommand{\@investigation}{\relax}
\newcommand{\investigation}[1]{\gdef\@investigation{#1}}
\newcommand{\@medicine}{\relax}
\newcommand{\medicine}[1]{\gdef\@medicine{#1}}
\newcommand{\@nature}{\relax}
\newcommand{\nature}[1]{\gdef\@nature{#1}}
\newcommand{\@perception}{\relax}
\newcommand{\perception}[1]{\gdef\@perception{#1}}
\newcommand{\@performance}{\relax}
\newcommand{\performance}[1]{\gdef\@performance{#1}}
\newcommand{\@persuasion}{\relax}
\newcommand{\persuasion}[1]{\gdef\@persuasion{#1}}
\newcommand{\@religion}{\relax}
\newcommand{\religion}[1]{\gdef\@religion{#1}}
\newcommand{\@sleightofhand}{\relax}
\newcommand{\sleightofhand}[1]{\gdef\@sleightofhand{#1}}
\newcommand{\@stealth}{\relax}
\newcommand{\stealth}[1]{\gdef\@stealth{#1}}
\newcommand{\@survival}{\relax}
\newcommand{\survival}[1]{\gdef\@survival{#1}}

\newcommand{\@skills}{\relax}
\newcommand{\collectSkills}{\gdef\@skills{
    \ifthenelse{\equal{\expandafter\@acrobatics}{}}{}{Acrobatics +\@acrobatics~}%
    \ifthenelse{\equal{\expandafter\@animalhandling}{}}{}{Animal handling +\@animalhandling~}%
    \ifthenelse{\equal{\expandafter\@arcana}{}}{}{Arcana +\@arcana~}%
    \ifthenelse{\equal{\expandafter\@athletics}{}}{}{Athletics +\@athletics~}%
    \ifthenelse{\equal{\expandafter\@deception}{}}{}{Deception +\@deception~}%
    \ifthenelse{\equal{\expandafter\@history}{}}{}{History +\@history~}%
    \ifthenelse{\equal{\expandafter\@insight}{}}{}{Insight +\@insight~}%
    \ifthenelse{\equal{\expandafter\@intimidation}{}}{}{Intimidation +\@intimidation~}%
    \ifthenelse{\equal{\expandafter\@investigation}{}}{}{Investigation +\@investigation~}%
    \ifthenelse{\equal{\expandafter\@medicine}{}}{}{Medicine +\@medicine~}%
    \ifthenelse{\equal{\expandafter\@nature}{}}{}{Nature +\@nature~}%
    \ifthenelse{\equal{\expandafter\@perception}{}}{}{Perception +\@perception~}%
    \ifthenelse{\equal{\expandafter\@performance}{}}{}{Performance +\@performance~}%
    \ifthenelse{\equal{\expandafter\@persuasion}{}}{}{Persuasion +\@persuasion~}%
    \ifthenelse{\equal{\expandafter\@religion}{}}{}{Religion +\@religion~}%
    \ifthenelse{\equal{\expandafter\@sleightofhand}{}}{}{Sleight of hand +\@sleightofhand~}%
    \ifthenelse{\equal{\expandafter\@stealth}{}}{}{Stealth +\@stealth~}%
    \ifthenelse{\equal{\expandafter\@survival}{}}{}{Survival +\@survival}}}%

\newcommand{\@dmgVulnerabilities}{\relax}
\newcommand{\dmgVulnerabilities}[1]{\gdef\@dmgVulnerabilities{#1}}
\newcommand{\@dmgResistances}{\relax}
\newcommand{\dmgResistances}[1]{\gdef\@dmgResistances{#1}}
\newcommand{\@dmgImmunities}{\relax}
\newcommand{\dmgImmunities}[1]{\gdef\@dmgImmunities{#1}}
\newcommand{\@conditionImmunities}{\relax}
\newcommand{\conditionImmunities}[1]{\gdef\@conditionImmunities{#1}}

\newcommand{\@senses}{\relax}
\newcommand{\senses}[1]{\gdef\@senses{#1}}
\newcommand{\@languages}{\relax}
\newcommand{\languages}[1]{\gdef\@languages{#1}}

\newcommand{\@challengeRating}{\relax}
\newcommand{\challengeRating}[1]{\gdef\@challengeRating{#1}}
\newcommand{\@group}{\relax}
\newcommand{\group}[1]{\gdef\@group{#1}}

\newcommand{\@legendaryDesc}{\relax}
\newcommand{\legendaryDesc}[1]{\gdef\@legendaryDesc{#1}}

%%%%%%%%%% SPELL CARDS %%%%%%%%%%

\newcommand{\setSpellStats}[1]{%
    \spellClasses{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['class'])}}
    \cardName{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['name'])}}
    \castingTime{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['casting_time'])}}
    \ritual{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['ritual'])}}
    \range{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['range'])}}
    \components{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['components'])}}
    \duration{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['duration'])}}
    \concentration{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['concentration'])}}
    \materials{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['material'])}}
    \descript{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['desc'])}}
    \higherlevels{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['higher_level'])}}
    \level{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['level_int'])}}
    \school{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['school'])}}
    \page{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['page'])}}
    \texmultiline{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['tex_multiline'])}}
    \textwosided{\luadirect{tex.sprint(luadata['spells'][\luaescapestring{#1}]['tex_twosided'])}}

    \luadirect{nClasses = table.getn(luadata['spells'][\luaescapestring{#1}]['class'])
        classestab = luadata['spells'][\luaescapestring{#1}]['class']
    }
}%

% -------- make spell cards --------
\newcommand{\makeSpellCards}{%
    \luadirect{getJSONdata('data/spells.json')}

    % set card color based on class
    \ifthenelse{\equal{\@classvar}{Artificer}}{\cardColor{artificerColor}}{%
        \ifthenelse{\equal{\@classvar}{Paladin}}{\cardColor{paladinColor}}{%
            \ifthenelse{\equal{\@classvar}{Cleric}}{\cardColor{clericColor}}{%
                \ifthenelse{\equal{\@classvar}{Wizard}}{\cardColor{wizardColor}}{%
                    \ifthenelse{\equal{\@classvar}{Sorcerer}}{\cardColor{sorcererColor}}{%
                        \ifthenelse{\equal{\@classvar}{Ranger}}{\cardColor{rangerColor}}{%
                            \ifthenelse{\equal{\@classvar}{Warlock}}{\cardColor{warlockColor}}{%
                                \ifthenelse{\equal{\@classvar}{Bard}}{\cardColor{bardColor}}{%
                                    \ifthenelse{\equal{\@classvar}{Druid}}{\cardColor{druidColor}}{%
                                        \cardColor{black}}}}}}}}}}
    \pagecolor{\@cardColor}

    \foreach \s in {1,2,...,\luadirect{tex.sprint(table.getn(luadata['spells']))}}{
        \IfSubStr{\luadirect{tex.sprint(luadata['spells'][\s]['class'])}}{\@classvar}{%
            \ifthenelse{\equal{\@filterBySource}{All}}{
                \setSpellStats{\s}
                \makeOneSpell%
                \pagebreak%
                \foreach \m in {1,...,\luadirect{tex.sprint(table.getn(luadata['monsters']))}}{
                    \monsterName{\luadirect{tex.sprint(luadata['monsters'][\m]['spell'])}}
                    \ifthenelse{\equal{\@cardName}{\@monsterName}}{
                        \setMonsterStats{\m}
                        \makeOneMonster%
                        \pagebreak%
                    }{}
                }
            }{%
                \IfSubStr{\luadirect{tex.sprint(luadata['spells'][\s]['page'])}}{\@filterBySource}{%
                    \setSpellStats{\s}
                    \makeOneSpell%
                    \pagebreak%
                    \foreach \m in {1,...,\luadirect{tex.sprint(table.getn(luadata['monsters']))}}{
                        \monsterName{\luadirect{tex.sprint(luadata['monsters'][\m]['spell'])}}
                        \ifthenelse{\equal{\@cardName}{\@monsterName}}{
                            \setMonsterStats{\m}
                            \makeOneMonster%
                            \pagebreak%
                        }{}
                    }
                }{}%    % end IfSubStr
            }       % end ifthenelse
        }{
            \ifthenelse{\equal{\@classvar}{All} \OR \equal{\@classvar}{}}{
                \setSpellStats{\s}
                \makeOneSpell%
                \pagebreak%
                \foreach \m in {1,...,\luadirect{tex.sprint(table.getn(luadata['monsters']))}}{
                    \monsterName{\luadirect{tex.sprint(luadata['monsters'][\m]['spell'])}}
                    \ifthenelse{\equal{\@cardName}{\@monsterName}}{
                        \setMonsterStats{\m}
                        \makeOneMonster%
                        \pagebreak%
                    }{}
                }
            }{}%
        }%    % end IfSubStr
    }%      % end foreach
}%

% -------- make one spell card --------
\newcommand{\makeOneSpell}{%
    \pagestyle{empty}

    \pagecolor{\@cardColor}
    \tcbset{colback=white,colframe=\@cardColor,size=fbox,beforeafter skip=0em}

    % card title
    \begin{tcolorbox}[squeezed title=\textsc{\@cardName},colback=\@cardColor,colbacktitle=white,coltitle=black,fonttitle=\Large, halign title=center]
    \end{tcolorbox}
    % class, level, school
    \begin{tcbraster}[raster columns=3, raster equal height, raster column skip=0.25em, raster before skip=-0.65em, raster row skip=0.25em]
        \begin{tcolorbox}[colback=\@cardColor,colframe=\@cardColor,halign=left]
            \color{white}{\scriptsize \textsc{\@level}}
        \end{tcolorbox}%
        \begin{tcolorbox}[colback=\@cardColor,colframe=\@cardColor,halign=center]
            \color{white}{\scriptsize \textsc{\@school}}
        \end{tcolorbox}%
        \begin{tcolorbox}[colback=\@cardColor,colframe=\@cardColor,halign=right]
            \color{white}{\scriptsize \textsc{\@page}}
        \end{tcolorbox}%
    \end{tcbraster}
    % info boxes
    \begin{tcbraster}[raster columns=12, raster equal height, raster column skip=0.25em, raster row skip=0.25em, raster before skip=-0.5em]
        % casting time
        \begin{tcolorbox}[raster multicolumn=4]
            \begin{center}
                \scriptsize \textsc{casting time} \par \@castingTime
            \end{center}
        \end{tcolorbox}%
        % ritual
        \begin{tcolorbox}[raster multicolumn=3]
            \begin{center}
                \scriptsize \textsc{ritual} \par \@ritual
            \end{center}
        \end{tcolorbox}%
        % range
        \begin{tcolorbox}[raster multicolumn=5]
            \begin{center}
                \scriptsize \textsc{range} \par \@range
            \end{center}
        \end{tcolorbox}
        % components
        \begin{tcolorbox}[raster multicolumn=4]
            \begin{center}
                \scriptsize \textsc{components} \par \@components
            \end{center}
        \end{tcolorbox}
        % duration
        \begin{tcolorbox}[raster multicolumn=6]
            \begin{center}
                \scriptsize \textsc{duration} \par \@duration
            \end{center}
        \end{tcolorbox}
        % concentration
        \begin{tcolorbox}[raster multicolumn=2]
            \begin{center}
                \scriptsize \textsc{conc} \par \@concentration
            \end{center}
        \end{tcolorbox}
    \end{tcbraster}
    % materials
    \ifthenelse{\equal{\@materials}{}}{}{%
        \begin{tcolorbox}[colback=\@cardColor,before skip=-0.5em,code={\setstretch{0.5}}]
            \color{white}{\scriptsize \textit{\@materials}}
        \end{tcolorbox}
    }
    % description
    \ifthenelse{\equal{\@classvar}{All}}{
        \tcboxfit[enhanced, height fill, fit fontsize macros, size=small, bottom=0.25em, fit basedim=8pt, before={\ifthenelse{\equal{\@materials}{}}{\vskip -4pt}{}}, title=\textsc{\@spellClasses}, fonttitle=\scriptsize, colbacktitle=\@cardColor,coltitle=white, attach boxed title to bottom left, boxed title style={empty,size=fbox}]{%
            \setlength{\parskip}{0.4em}
            \setlength{\parindent}{0em}
            \@descript
            \ifthenelse{\equal{\@higherlevels}{}}{}{%
                \par \textbf{At higher levels:} \@higherlevels%
            }
        }
    }{
        \tcboxfit[enhanced, height fill, fit fontsize macros, size=small, bottom=0.25em, fit basedim=8pt, before={\ifthenelse{\equal{\@materials}{}}{\vskip -4pt}{}}, title=\textsc{\@classvar}, fonttitle=\scriptsize, colbacktitle=\@cardColor,coltitle=white, attach boxed title to bottom left, boxed title style={empty,size=fbox}]{%
            \setlength{\parskip}{0.4em}
            \setlength{\parindent}{0em}
            \@descript
            \ifthenelse{\equal{\@higherlevels}{}}{}{%
                \par \textbf{At higher levels:} \@higherlevels%
            }
        }
    }
}%

%%%%%%%%%% ARTIFICER INFUSION CARDS %%%%%%%%%%

\newcommand{\makeInfusionCards}{%
    \luadirect{getJSONdata('data/infusions.json')}
    \foreach \i in {1,2,...,\luadirect{tex.sprint(table.getn(luadata['infusions']))}}{%
        \cardName{\luadirect{tex.sprint(luadata['infusions'][\i]['name'])}}
        \descript{\luadirect{tex.sprint(luadata['infusions'][\i]['desc'])}}
        \prerequisite{\luadirect{tex.sprint(luadata['infusions'][\i]['prerequisite'])}}
        \nonmagicitem{\luadirect{tex.sprint(luadata['infusions'][\i]['item'])}}
        \requiresattunement{\luadirect{tex.sprint(luadata['infusions'][\i]['requires_attunement'])}}
        \makeOneInfusion%
        \pagebreak%
    }
    % homunculus servant stat block
    \setMonsterStats{1}
    \makeOneMonster%
    \pagebreak%
}

% -------- make one infusion card --------
\newcommand{\makeOneInfusion}{%
    \pagestyle{empty}

    \cardColor{artificerColor}
    \pagecolor{\@cardColor}

    \tcbset{colback=white,colframe=\@cardColor,size=fbox,beforeafter skip=0em}

    % card title
    \begin{tcolorbox}[squeezed title=\textsc{\@cardName},colback=\@cardColor,colbacktitle=white,coltitle=black,fonttitle=\Large, halign title=center]
        \begin{center}
            \color{white}{\footnotesize \textsc{\@prerequisite~infusion}}
        \end{center}
    \end{tcolorbox}

    \begin{tcbraster}[raster columns=12, raster equal height, raster column skip=0.25em, raster before skip=-1em, raster row skip=0.25em]
        \begin{tcolorbox}[raster multicolumn=7]
            \begin{center}
                \scriptsize \textsc{item} \par \@nonmagicitem
            \end{center}
        \end{tcolorbox}
        % requires attunement
        \begin{tcolorbox}[raster multicolumn=5]
            \begin{center}
                \scriptsize \textsc{req attunement} \par \@requiresattunement
            \end{center}
        \end{tcolorbox}
    \end{tcbraster}

    % description
    \tcboxfit[enhanced, height fill, fit fontsize macros, size=small, bottom=0.25em, fit basedim=10pt, before={\vskip -4pt}, title=\textsc{\@page}, fonttitle=\scriptsize, colbacktitle=\@cardColor,coltitle=white, attach boxed title to bottom right, boxed title style={empty,size=fbox}]{%
        \setlength{\parskip}{0.4em}
        \setlength{\parindent}{0em}
        \@descript
    }
}

%%%%%%%%%% MONSTER CARDS %%%%%%%%%%

\newcommand{\setMonsterStats}[1]{%
    \monsterName{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['name'])}}
    \size{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['size'])}}
    \type{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['type'])}}
    \subtype{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['subtype'])}}
    \alignment{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['alignment'])}}
    \armorClass{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['armor_class'])}}
    \armorDesc{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['armor_desc'])}}
    \hitPoints{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['hit_points'])}}
    \hitDice{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['hit_dice'])}}

    \speed{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['speed'])}}
    \walkSpeed{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['speed_json']['walk'])}}
    \flySpeed{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['speed_json']['fly'])}}
    \swimSpeed{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['speed_json']['swim'])}}

    \STR{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['strength'])}}
    \DEX{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['dexterity'])}}
    \CON{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['constitution'])}}
    \INT{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['intelligence'])}}
    \WIS{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['wisdom'])}}
    \CHA{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['charisma'])}}

    \STRsave{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['strength_save'])}}
    \DEXsave{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['dexterity_save'])}}
    \CONsave{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['constitution_save'])}}
    \INTsave{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['intelligence_save'])}}
    \WISsave{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['wisdom_save'])}}
    \CHAsave{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['charisma_save'])}}
    \collectSaves

    \acrobatics{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['acrobatics'])}}
    \animalhandling{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['animal_handling'])}}
    \arcana{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['arcana'])}}
    \athletics{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['athletics'])}}
    \deception{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['deception'])}}
    \history{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['history'])}}
    \insight{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['insight'])}}
    \intimidation{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['intimidation'])}}
    \investigation{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['investigation'])}}
    \medicine{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['medicine'])}}
    \nature{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['nature'])}}
    \perception{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['perception'])}}
    \performance{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['performance'])}}
    \persuasion{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['persuasion'])}}
    \religion{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['religion'])}}
    \sleightofhand{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['sleight_of_hand'])}}
    \stealth{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['stealth'])}}
    \survival{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['survival'])}}
    \collectSkills

    \dmgVulnerabilities{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['damage_vulnerabilities'])}}
    \dmgResistances{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['damage_resistances'])}}
    \dmgImmunities{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['damage_immunities'])}}
    \conditionImmunities{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['condition_immunities'])}}

    \senses{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['senses'])}}
    \languages{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['languages'])}}

    \challengeRating{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['challenge_rating'])}}
    \group{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['group'])}}

    \luadirect{nAbilities = table.getn(luadata['monsters'][\luaescapestring{#1}]['special_abilities'])
        abilitiestab = luadata['monsters'][\luaescapestring{#1}]['special_abilities']
        nActions = table.getn(luadata['monsters'][\luaescapestring{#1}]['actions'])
        actionstab = luadata['monsters'][\luaescapestring{#1}]['actions']
        nReactions = table.getn(luadata['monsters'][\luaescapestring{#1}]['reactions'])
        reactionstab = luadata['monsters'][\luaescapestring{#1}]['reactions']
        nBonusactions = table.getn(luadata['monsters'][\luaescapestring{#1}]['bonus_actions'])
        bonusactionstab = luadata['monsters'][\luaescapestring{#1}]['bonus_actions']
        nLegendaryActions = table.getn(luadata['monsters'][\luaescapestring{#1}]['legendary_actions'])
        legendaryactionstab = luadata['monsters'][\luaescapestring{#1}]['legendary_actions']
    }
    \legendaryDesc{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['legendary_desc'])}}

    \texmultiline{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['tex_multiline'])}}
    \textwosided{\luadirect{tex.sprint(luadata['monsters'][\luaescapestring{#1}]['tex_twosided'])}}
}%

\newcommand{\makeMonsterCards}[1]{%
    \luadirect{getJSONdata('data/#1')}
    \pagecolor{white}
    \foreach \m in {1,...,\luadirect{tex.sprint(table.getn(luadata['monsters']))}}{%
        \setMonsterStats{\m}
        \makeOneMonster%
        \pagebreak%
    }%
}%

% -------- make one monster card --------
\newcommand{\makeOneMonster}{%
    \pagestyle{empty}
    \setlength{\parskip}{0pt}
    \setlength{\parindent}{0em}

    \pagecolor{white}
    \tcbset{colback=white,colframe=white,size=fbox,beforeafter skip=0em}

    % title, size, type, alignment, CR
    \begin{tcbraster}[raster columns=24, raster after skip = -1pt]
        \ifthenelse{\equal{\@challengeRating}{}}{%
            \begin{tcolorbox}[raster multicolumn=24,squeezed title=\@monsterName,colbacktitle=white,coltitle=darkred,fonttitle=\LARGE\sffamily\scshape,top=-3pt]
                \footnotesize \textit{\@size~\@type\ifthenelse{\equal{\@subtype}{}}{}{~(\@subtype)}\ifthenelse{\equal{\@alignment}{}}{}{,~\@alignment}}
            \end{tcolorbox}
        }{%
            \begin{tcolorbox}[raster multicolumn=20,squeezed title=\@monsterName,colbacktitle=white,coltitle=darkred,fonttitle=\LARGE\sffamily\scshape,top=-3pt]
                \footnotesize \textit{\@size~\@type\ifthenelse{\equal{\@subtype}{}}{}{~(\@subtype)}\ifthenelse{\equal{\@alignment}{}}{}{,~\@alignment}}
            \end{tcolorbox}
            \begin{tcolorbox}[raster multicolumn=4,colframe=darkred]
                \begin{center}
                    \tiny \textbf{CR}~\@challengeRating \par (\luadirect{tex.sprint(CRtoXP['\@challengeRating'])} XP)
                \end{center}
            \end{tcolorbox}
        }
    \end{tcbraster}

    \color{darkred}{\noindent\rule{\textwidth}{1pt}}

    % info
    \begin{tcolorbox}[]
        \ifthenelse{\equal{\@texmultiline}{true}}{
            \color{darkred} \footnotesize \textbf{AC}~\@armorClass~\ifthenelse{\equal{\@armorDesc}{}}{}{(\textit{\@armorDesc})} \hfill
            \textbf{HP}~\@hitPoints~\ifthenelse{\equal{\@hitDice}{}}{}{~(\@hitDice)}\par
            \textbf{Speed} \@speed
        }{%
            \color{darkred} \footnotesize \textbf{AC}~\@armorClass~\ifthenelse{\equal{\@armorDesc}{}}{}{(\textit{\@armorDesc})} \hfill \textbf{HP}~\@hitPoints~\ifthenelse{\equal{\@hitDice}{}}{}{~(\@hitDice)} \hfill \textbf{Speed} \@speed
        }
    \end{tcolorbox}

    \color{darkred}{\noindent\rule{\textwidth}{1pt}}

    \printStats
    \vskip -10pt

    \color{darkred}{\noindent\rule{\textwidth}{1pt}}

    \vskip 3pt
    \ifthenelse{\equal{\@textwosided}{actions}}{
        \tcboxfit[height fill, fit fontsize macros, fit basedim=10pt]{%
            \printInfo

            \color{darkred}{\noindent\rule{\textwidth}{1pt}}

            \printAbilities
        }
        \pagebreak%
        \tcboxfit[height fill, fit fontsize macros, fit basedim=10pt]{%
            \printActions
            \printReactions
            \printBonusActions
            \printLegendaryActions
        }%
    }{%
        \tcboxfit[height fill, fit fontsize macros, fit basedim=10pt]{%
            \printInfo

            \color{darkred}{\noindent\rule{\textwidth}{1pt}}

            \printAbilities

            \printActions
            \printReactions
            \printBonusActions
            \printLegendaryActions
        }
    }%
}

\newcommand{\printActions}{%
    \setlength{\parskip}{0.4em}
    \ifthenelse{\equal{\luadirect{tex.sprint(nActions)}}{}}{}{
        \color{darkred}{\Large{\textsc{\sffamily{Actions}} \par \vskip -3\parskip \noindent\rule{\textwidth}{1pt}}}
        \foreach \a in {1,...,\luadirect{tex.sprint(nActions)}}{%
            \color{black} \textit{\textbf{\luadirect{tex.sprint(actionstab[\a]['name'])}}}~\luadirect{tex.sprint(actionstab[\a]['desc'])} \par
        }
    }
}%

\newcommand{\printReactions}{%
    \setlength{\parskip}{0.4em}
    \ifthenelse{\equal{\luadirect{tex.sprint(nReactions)}}{}}{}{
        \color{darkred}{\Large{\textsc{\sffamily{Reactions}} \par \vskip -3\parskip \noindent\rule{\textwidth}{1pt}}}
        \foreach \r in {1,...,\luadirect{tex.sprint(nReactions)}}{%
            \color{black} \textit{\textbf{\luadirect{tex.sprint(reactionstab[\r]['name'])}}}~\luadirect{tex.sprint(reactionstab[\r]['desc'])} \par
        }
    }
}%

\newcommand{\printBonusActions}{%
    \setlength{\parskip}{0.4em}
    \ifthenelse{\equal{\luadirect{tex.sprint(nBonusactions)}}{}}{}{
        \color{darkred}{\Large{\textsc{\sffamily{Bonus Actions}} \par \vskip -3\parskip \noindent\rule{\textwidth}{1pt}}}
        \foreach \r in {1,...,\luadirect{tex.sprint(nBonusactions)}}{%
            \color{black} \textit{\textbf{\luadirect{tex.sprint(bonusactionstab[\r]['name'])}}}~\luadirect{tex.sprint(bonusactionstab[\r]['desc'])} \par
        }
    }
}%

\newcommand{\printLegendaryActions}{
    \ifthenelse{\equal{\@legendaryDesc}{}}{}{%
            \setlength{\parskip}{0.4em}
            \color{darkred}{\Large{\textsc{\sffamily{Legendary Actions}} \par
            \vskip -3\parskip
            \noindent\rule{\textwidth}{1pt}}}
            \color{black} \@legendaryDesc \par
            \foreach \a in {1,...,\luadirect{tex.sprint(nLegendaryActions)}}{%
                \color{black} \textit{\textbf{\luadirect{tex.sprint(legendaryactionstab[\a]['name'])}}}~\luadirect{tex.sprint(legendaryactionstab[\a]['desc'])} \par
            }
    }
}

\newcommand{\printAbilities}{
    \color{black}
    \setlength{\parskip}{0.4em}
    \ifthenelse{\equal{\luadirect{tex.sprint(nAbilities)}}{}}{}{%
        \foreach \a in {1,...,\luadirect{tex.sprint(nAbilities)}}{%
            \textit{\textbf{\luadirect{tex.sprint(abilitiestab[\a]['name'])}}}~\luadirect{tex.sprint(abilitiestab[\a]['desc'])} \par
        }%
    }%
}

\newcommand{\printInfo}{
    \color{darkred} \footnotesize
    \ifthenelse{\equal{\@STRsave}{} \AND \equal{\@DEXsave}{} \AND \equal{\@CONsave}{} \AND \equal{\@INTsave}{} \AND \equal{\@WISsave}{} \AND \equal{\@CHAsave}{}}{}{\textbf{Saving Throws}~\@savingthrows \par}
    \ifthenelse{\equal{\@acrobatics}{} \AND \equal{\@animalhandling}{} \AND \equal{\@arcana}{} \AND \equal{\@athletics}{} \AND \equal{\@deception}{} \AND \equal{\@history}{} \AND \equal{\@insight}{} \AND \equal{\@investigation}{} \AND \equal{\@intimidation}{} \AND \equal{\@medicine}{} \AND \equal{\@nature}{} \AND \equal{\@perception}{} \AND \equal{\@performance}{} \AND \equal{\@persuasion}{} \AND \equal{\@religion}{} \AND \equal{\@sleightofhand}{} \AND \equal{\@stealth}{} \AND \equal{\@survival}{}}{}{\textbf{Skills}~\@skills \par}
    \ifthenelse{\equal{\@dmgImmunities}{}}{}{\textbf{Damage Immunities}~\@dmgImmunities \par}
    \ifthenelse{\equal{\@dmgResistances}{}}{}{\textbf{Damage Resistances}~\@dmgResistances \par}
    \ifthenelse{\equal{\@dmgVulnerabilities}{}}{}{\textbf{Damage Vulnerabilities}~\@dmgVulnerabilities \par}
    \ifthenelse{\equal{\@conditionImmunities}{}}{}{\textbf{Condition Immunities}~\@conditionImmunities \par}
    \textbf{Senses}~\ifthenelse{\equal{\@senses}{}}{---}{\@senses} \par
    \textbf{Languages}~\ifthenelse{\equal{\@languages}{}}{---}{\@languages} \par
}

\newcommand{\printStats}{%
    \begin{center}
        \begin{tcbraster}[raster columns=6, raster equal height, raster row skip=0pt, raster before skip=-10pt, raster after skip=-10pt]
            \begin{tcolorbox}
                \color{darkred} \footnotesize \begin{center} \textbf{STR} \par \@STR~(\printMod{\@STRmod}) \end{center}
            \end{tcolorbox}
            \begin{tcolorbox}
                \color{darkred} \footnotesize \begin{center} \textbf{DEX} \par \@DEX~(\printMod{\@DEXmod}) \end{center}
            \end{tcolorbox}
            \begin{tcolorbox}
                \color{darkred} \footnotesize \begin{center} \textbf{CON} \par \@CON~(\printMod{\@CONmod}) \end{center}
            \end{tcolorbox}
            \begin{tcolorbox}
                \color{darkred} \footnotesize \begin{center} \textbf{INT} \par \@INT~(\printMod{\@INTmod}) \end{center}
            \end{tcolorbox}
            \begin{tcolorbox}
                \color{darkred} \footnotesize \begin{center} \textbf{WIS} \par \@WIS~(\printMod{\@WISmod}) \end{center}
            \end{tcolorbox}
            \begin{tcolorbox}
                \color{darkred} \footnotesize \begin{center} \textbf{CHA} \par \@CHA~(\printMod{\@CHAmod}) \end{center}
            \end{tcolorbox}
        \end{tcbraster}
    \end{center}%
}
