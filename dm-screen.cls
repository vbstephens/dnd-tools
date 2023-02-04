\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dm-screen}

%%%%%%%%%% USER OPTIONS FOR CLASS %%%%%%%%%%

%%%%%%%%%% MAIN OPTIONS TO CLASS %%%%%%%%%%
\LoadClass{article}

%%%%%%%%%% PACKAGES %%%%%%%%%%

% -------- geometry --------
\RequirePackage[letterpaper,landscape,margin=0.1in,top=0in,bottom=0.25in]{geometry}

% -------- fonts --------
\RequirePackage[scale=0.95]{roboto}
\RequirePackage{fontspec}

\setmainfont{Roboto}
%\setmainfont{Mrs Eaves}
\setsansfont{Mrs Eaves}      % for titles

% -------- typesetting --------
\RequirePackage{microtype}

% -------- formatting --------
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage[many]{tcolorbox}
\RequirePackage{amssymb}
\RequirePackage{tabularx}

% -------- tools --------
\RequirePackage{xifthen}
%\RequirePackage{luacode}
\RequirePackage{pgffor}
\RequirePackage{xstring}

%%%%%%%%%% DM SCREEN %%%%%%%%%%

\newcommand{\makeDMscreen}{%
    \pagestyle{empty}
    \tcbset{colback=white,colframe=black,size=small,beforeafter skip=0em,coltitle=black,colbacktitle=white}
    %---------- PAGE 1 ----------
    \begin{tcbraster}[raster columns=12, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
        \tcboxfit[raster multicolumn=4,height fill, fit fontsize macros, fit basedim=11pt, squeezed title=combat actions,fonttitle=\LARGE\sffamily\scshape, halign title=center]{\combatActionsTable}
        \begin{tcolorbox}[raster multicolumn=4,blankest]
            \begin{tcbraster}[raster columns=12, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
                \tcbset{colback=white,colframe=black,size=small,beforeafter skip=0em,coltitle=black,colbacktitle=white,fonttitle=\LARGE\sffamily\scshape, halign title=center}
                \begin{tcolorbox}[raster multicolumn=12,blankest]
                    \begin{tcbraster}[raster columns=12, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
                        \tcbset{colback=white,colframe=black,size=small,beforeafter skip=0em,coltitle=black,colbacktitle=white,fonttitle=\LARGE\sffamily\scshape, halign title=center}
                        \begin{tcolorbox}[squeezed title=spellcasting,raster multicolumn=12, top=0.25em,bottom=0.25em] \spellcastingTable \end{tcolorbox}
                        \begin{tcolorbox}[squeezed title=concentration,raster multicolumn=12, top=0.25em,bottom=0.25em] \concentrationTable \end{tcolorbox}
                        \begin{tcolorbox}[squeezed title=cover,raster multicolumn=5, top=0.25em,bottom=0.25em] \coverTable \end{tcolorbox}
                        \begin{tcolorbox}[squeezed title=stealth,raster multicolumn=7, top=0.25em,bottom=0.25em] \stealthTable \end{tcolorbox}
                        \begin{tcolorbox}[squeezed title=exhaustion,raster multicolumn=12] \exhaustionTable \end{tcolorbox}
                    \end{tcbraster}
                \end{tcolorbox}
            \end{tcbraster}
        \end{tcolorbox}
        \tcboxfit[raster multicolumn=4, height fill, fit fontsize macros, fit basedim=11pt, squeezed title=conditions,fonttitle=\LARGE\sffamily\scshape, halign title=center]{\conditionsTable}
    \end{tcbraster}

    %---------- PAGE 2 ----------
    \pagebreak
    \begin{tcbraster}[raster columns=12, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
        \tcboxfit[raster multicolumn=4,height fill, fit fontsize macros, fit basedim=11pt, squeezed title=special movement,fonttitle=\LARGE\sffamily\scshape, halign title=center]{\specialMovementTable}
        \begin{tcolorbox}[raster multicolumn=4,blankest]
            \begin{tcbraster}[raster columns=12, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
                \tcbset{colback=white,colframe=black,size=small,beforeafter skip=0em,coltitle=black,colbacktitle=white,fonttitle=\LARGE\sffamily\scshape, halign title=center}
                \begin{tcolorbox}[raster multicolumn=12,blankest]
                    \begin{tcbraster}[raster columns=12, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
                        \tcbset{colback=white,colframe=black,size=small,beforeafter skip=0em,coltitle=black,colbacktitle=white,fonttitle=\LARGE\sffamily\scshape, halign title=center}
                        \begin{tcolorbox}[squeezed title=death,raster multicolumn=12, top=0.25em,bottom=0.25em] \deathTable \end{tcolorbox}
                        \begin{tcolorbox}[squeezed title=vision,raster multicolumn=6, top=0.25em,bottom=0.25em] \visionTable \end{tcolorbox}
                        \begin{tcolorbox}[squeezed title=skills,raster multicolumn=6, top=0.25em,bottom=0.25em] \skillsTable \end{tcolorbox}
                        \begin{tcolorbox}[squeezed title=resting,raster multicolumn=12] \restingTable \end{tcolorbox}
                    \end{tcbraster}
                \end{tcolorbox}
            \end{tcbraster}
        \end{tcolorbox}
        \begin{tcolorbox}[squeezed title=players,raster multicolumn=4, top=0.25em, bottom=0.25em,fonttitle=\LARGE\sffamily\scshape, halign title=center]
            \begin{center}
            \includegraphics[width=0.92\textwidth]{player-reference}
            \vskip 0.25em
            \includegraphics[width=0.92\textwidth]{player-reference}
            \vskip 0.25em
            \includegraphics[width=0.92\textwidth]{player-reference}
            \vskip 0.25em
            \includegraphics[width=0.92\textwidth]{player-reference}
            \end{center}
        \end{tcolorbox}

    \end{tcbraster}


    %---------- PAGE 3 ----------
    \pagebreak
    \begin{tcbraster}[raster columns=24, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
        \tcbset{colback=white,colframe=black,size=small,beforeafter skip=0em,coltitle=black,colbacktitle=white,fonttitle=\LARGE\sffamily\scshape, halign title=center}
        \begin{tcolorbox}[raster multicolumn=4,blankest]
            \begin{tcbraster}[raster columns=1, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
                \tcbset{colback=white,colframe=black,size=small,beforeafter skip=0em,coltitle=black,colbacktitle=white,fonttitle=\LARGE\sffamily\scshape, halign title=center}
                \tcboxfit[raster multicolumn=1,height=0.4\textheight, fit fontsize macros, fit basedim=11pt, squeezed title=damage types,fonttitle=\LARGE\sffamily\scshape, halign title=center]{\damageTypesTable}
            \end{tcbraster}
        \end{tcolorbox}
        \begin{tcolorbox}[raster multicolumn=12,blankest]
            \begin{tcbraster}[raster columns=1, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
                \tcbset{colback=white,colframe=black,size=small,beforeafter skip=0em,coltitle=black,colbacktitle=white,fonttitle=\LARGE\sffamily\scshape, halign title=center}
                \tcboxfit[raster multicolumn=1,height=0.975\textheight, fit fontsize macros, fit basedim=11pt, squeezed title=weapons,fonttitle=\LARGE\sffamily\scshape, halign title=center]{\weaponsTable}
            \end{tcbraster}
        \end{tcolorbox}
        \begin{tcolorbox}[raster multicolumn=8,blankest]
            \begin{tcbraster}[raster columns=1, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
                \tcbset{colback=white,colframe=black,size=small,beforeafter skip=0em,coltitle=black,colbacktitle=white,fonttitle=\LARGE\sffamily\scshape, halign title=center}
                \tcboxfit[raster multicolumn=1,height=0.45\textheight, fit fontsize macros, fit basedim=11pt, squeezed title=armor,fonttitle=\LARGE\sffamily\scshape, halign title=center]{\armorTable}
                \tcboxfit[raster multicolumn=1, height=0.525\textheight, fit fontsize macros, fit basedim=11pt, squeezed title=weapon properties,fonttitle=\LARGE\sffamily\scshape, halign title=center]{\weaponPropertiesTable}
            \end{tcbraster}
        \end{tcolorbox}
    \end{tcbraster}


        %---------- PAGE 4 ----------
    \pagebreak
    \begin{tcbraster}[raster columns=24, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
        \tcbset{colback=white,colframe=black,size=small,beforeafter skip=0em,coltitle=black,colbacktitle=white,fonttitle=\LARGE\sffamily\scshape, halign title=center}
        \begin{tcolorbox}[raster multicolumn=5,blankest]
            \begin{tcbraster}[raster columns=1, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
                \tcbset{colback=white,colframe=black,size=small,beforeafter skip=0em,coltitle=black,colbacktitle=white,fonttitle=\LARGE\sffamily\scshape, halign title=center}
                \begin{tcolorbox}[squeezed title=areas by level,raster multicolumn=1] \areasByLevel \end{tcolorbox}
                \begin{tcolorbox}[squeezed title=features of barovia,raster multicolumn=1, top=0.25em] \landsOfBaroviaFeatures \end{tcolorbox}
            \end{tcbraster}
        \end{tcolorbox}
        \begin{tcolorbox}[raster multicolumn=11,blankest]
            \begin{tcbraster}[raster columns=11, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
                \tcbset{colback=white,colframe=black,size=small,beforeafter skip=0em,coltitle=black,colbacktitle=white,fonttitle=\LARGE\sffamily\scshape, halign title=center}
                \begin{tcolorbox}[raster multicolumn=5,blankest]
                    \begin{tcbraster}[raster columns=1, raster valign=top, raster column skip=0.25em, raster row skip=0.25em]
                        \tcbset{colback=white,colframe=black,size=small,beforeafter skip=0em,coltitle=black,colbacktitle=white,fonttitle=\LARGE\sffamily\scshape, halign title=center}
                        \begin{tcolorbox}[squeezed title=random books,raster multicolumn=1] \randomBooksTable \end{tcolorbox}
                        \begin{tcolorbox}[height=1.22in, squeezed title=barovia house occupants,raster multicolumn=1] \baroviaRandomHouseOccupants \end{tcolorbox}
                    \end{tcbraster}
                \end{tcolorbox}
                \begin{tcolorbox}[squeezed title=ravenloft random encounters,raster multicolumn=6,top=0.25em] \ravenloftRandomEncountersTable \end{tcolorbox}
                \tcboxfit[raster multicolumn=11, height=4.33in, fit fontsize macros, fit basedim=11pt, squeezed title=barovia random encounters,fonttitle=\LARGE\sffamily\scshape, halign title=center]{\baroviaRandomEncountersTable}
            \end{tcbraster}
        \end{tcolorbox}
        \tcboxfit[raster multicolumn=8, height fill, fit fontsize macros, fit basedim=10pt, squeezed title=gothic trinkets,fonttitle=\LARGE\sffamily\scshape, halign title=center]{\gothicTrinketsTable}
    \end{tcbraster}

    %---------- MISC ----------
}

%%%%%%%%%% GENERAL CONTENT %%%%%%%%%%

\newcommand{\conditionsTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \textbf{\textsc{blinded}} Auto-fail sight-dependent checks. Disadvantage to your attacks; advantage to hostile attacks. \par
    \textbf{\textsc{charmed}} Cannot hurt or attack the charmer. Charmer has advantage on social ability checks. \par
    \textbf{\textsc{deafened}} Auto-fail hearing-dependent checks. \par
    \textbf{\textsc{frightened}} Disadvantage on ability checks and attacks while source of fear is within line of sight. Cannot willingly move closer to source of fear. \par
    \textbf{\textsc{grappled}} Speed reduced to 0; no speed bonuses. Ends when grappler is incapacitated, you escape, or you are forcibly separated. Grappler can move with you at half speed. \par
    \textbf{\textsc{incapacitated}} Cannot take actions or reactions. \par
    \textbf{\textsc{invisible}} Heavily obscured while hiding; you still make noise and tracks. Advantage while attacking; hostiles have disadvantage. \par
    \textbf{\textsc{paralyzed}} Incapacitated; cannot move or speak. Auto-fail Strength and Dexterity saves. Hostiles have advantage. Attacks that hit from within 5 feet are automatic critical hits. \par
    \textbf{\textsc{petrified}} Weight increases tenfold. Incapacitated and unaware of surroundings. Hostiles have advantage. Auto-fail Strength and Dexterity saves. Resist all damage, poison, and disease. \par
    \textbf{\textsc{poisoned}} Disadvantage on attack rolls and ability checks. \par
    \textbf{\textsc{prone}} Can only crawl at half speed until you stand up. Attacks have disadvantage. Hostiles have advantage within 5 feet and disadvantage over 5 feet. Standing up uses half of your base movement. \par
    \textbf{\textsc{restrained}} Speed reduced to 0. Disadvantage on attacks and Dexterity saves. Hostiles have advantage. \par
    \textbf{\textsc{stunned}} Incapacitated, cannot move, and fragmented speech. Auto-fail Strength and Dexterity saves. Hostiles have advantage. \par
    \textbf{\textsc{unconscious}} Incapacitated, prone, cannot move or speak, and unaware of surroundings. Auto-fail Strength and Dexterity saves. Hostiles have advantage. Attacks that hit you from within 5 feet are automatic critical hits.
}

\newcommand{\combatActionsTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \textbf{\textsc{attack}} Make a melee or ranged weapon attack. \par
    \textbf{\textsc{cast a spell}} Spell must have a casting time of 1 action. \par
    \textbf{\textsc{climb onto larger creature}} Athletics/Acrobatics vs. Acrobatics. If successful, you climb on and treat target’s space as difficult terrain. Target may use an action to make an Athletics check against your Athletics/Acrobatics to dislodge you. \par
    \textbf{\textsc{dash}} Move extra distance equal to your current speed. \par
    \textbf{\textsc{disarm}} Attack roll vs. target’s Athletics/Acrobatics. On success, target drops held item. Disadvantage if target item is being held in both hands. \par
    \textbf{\textsc{disengage}} Movement this turn does not provoke opportunity attacks. \par
    \textbf{\textsc{dodge}} Attacks made against you have disadvantage; advantage on Dexterity saving throws until the start of your next turn. Effect ends if your speed drops to 0 or you are incapacitated. \par
    \textbf{\textsc{escape grapple}} Athletics/Acrobatics vs. Athletics. \par
    \textbf{\textsc{first aid}} DC 10 Medicine to stabilize dying creature. \par
    \textbf{\textsc{grapple}} Athletics vs. Athletics/Acrobatics. On success, target becomes grappled. Cannot be used on creatures more than one size larger than you. \par
    \textbf{\textsc{help}} Give target advantage on next ability check or attack roll (creature must be within 5 feet of you) they make before the start of your next turn. \par
    \textbf{\textsc{hide}} Stealth check to become hidden. \par
    \textbf{\textsc{mark}} Mark target in addition to melee attack. Your opportunity attacks against marked target have advantage until the start of your next turn and do not use your reaction. Limit 1/turn.\par
    \textbf{\textsc{move through opponent's space}} Opposed Athletics to run; opposed Acrobatics to tumble. \par
    \textbf{\textsc{ready}} Ready an action to use when a certain trigger occurs. Using this is a reaction and does not interrupt the trigger. Readied spells require concentration until they activate. \par
    \textbf{\textsc{shove}} As grapple, but can choose to push 5 feet away or knock prone. \par
}

\newcommand{\coverTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
%    \begin{itemize}[leftmargin=0.75em,topsep=0pt,noitemsep]
%        \item \textbf{\textsc{half cover}} +2 to AC and Dexterity saves.
%        \item \textbf{\textsc{3/4 cover}} +5 to AC and Dexterity saves.
%        \item \textbf{\textsc{total cover}} Cannot be directly targeted.
%    \end{itemize}
    \textbf{\textsc{half cover}} +2 to AC and Dexterity saves. \par
    \textbf{\textsc{3/4 cover}} +5 to AC and Dexterity saves. \par
    \textbf{\textsc{total cover}} Cannot be directly targeted.
}

\newcommand{\restingTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \textbf{\textsc{short rest}} 1 hour. Spend hit dice to regain HP. \par
    \textbf{\textsc{long rest}} 8 hours. Regain full HP and half of your maximum hit dice.
}

\newcommand{\stealthTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
%    \raggedright
    \textbf{\textsc{hiding}} Stealth vs. Perception/PP. Cannot hide while engaged in melee. \par
    \textbf{\textsc{lightly obscured}} Disadvantage on Perception checks. \par
    \textbf{\textsc{heavily obscured}} See \textsc{blinded}.
}

\newcommand{\exhaustionTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \setlength{\tabcolsep}{0.25em}
%    \renewcommand{\arraystretch}{1.5}
    \begin{tabularx}{\textwidth}{c >{\raggedright\arraybackslash}X}
        \textbf{\textsc{lvl}} & \textbf{\textsc{effect}} \\
        1 & Disadvantage on ability checks                 \\
        2 & Speed halved                                   \\
        3 & Disadvantage on attack rolls and saving throws \\
        4 & Hit Point maximum halved                       \\
        5 & Speed reduced to 0                             \\
        6 & Death
    \end{tabularx}
}

\newcommand{\deathTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \textbf{\textsc{instant death}} If you drop to 0 HP and leftover damage exceeds your maximum HP, you die instantly. \par
    \textbf{\textsc{death saving throws}} If you start your turn with 0 HP, roll a d20. 1-9: failure; 10-20: success. At three successes, you are stabilized; at three failures, you are dead. Nat 20 = 2 successes; nat 1 = 2 failures. \par
    \textbf{\textsc{damage while dying}} Suffer a saving throw failure if you take damage while dying. \par
    \textbf{\textsc{stabilizing}} Stable creatures do not make death saving throws and regain 1 HP after 1d4 hours. \par
    \textbf{\textsc{suffocating}} You can hold breath for a number of minutes equal to 1 + your Constitution modifier (minimum 30 seconds). Afterward, you last a number of rounds equal to your Constitution modifier (minimum 1) but drop to 0 and start dying at start of your next turn.
}

\newcommand{\visionTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \textbf{\textsc{blindsight}} A creature with blindsight can perceive its surroundings without seeing them, within a specific radius. \par
    \textbf{\textsc{darkvision}} Within a specified range, a creature with darkvision sees dim light as if it were bright light. Additionally, it sees all darkness as dim light, though it can only perceive shades of gray.
}

\newcommand{\skillsTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \raggedright
    \textbf{\textsc{strength}} Athletics \par
    \textbf{\textsc{dexterity}} Acrobatics, Sleight of Hand, Stealth \par
%    \textbf{\textsc{constitution}} \textit{Concentration} \par
    \textbf{\textsc{intelligence}} Arcana, History, Investigation, Nature, Religion \par
    \textbf{\textsc{wisdom}} Animal Handling, Insight, Medicine, Perception, Survival \par
    \textbf{\textsc{charisma}} Deception, Intimidation, Performance, Persuasion
}

\newcommand{\specialMovementTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \textbf{\textsc{falling}} 1d6 bludgeoning damage for every 10 feet you fall, up to 20d6. \par
    \textbf{\textsc{long jump}} Up to Strength score in feet with 10 foot running start and half that distance with a standing start. If landing on difficult terrain, DC 10 Acrobatics or fall prone. \par
    \textbf{\textsc{high jump}} Up to 3 + Strength mod feet with 10 foot running start and half that height with a standing start. \par
    \textbf{\textsc{flight}} If a flying creature is knocked prone, has its speed reduced to 0, or is otherwise prevented from moving, it falls and takes 1d10 damage for every 10 feet it plummets. The ability to hover or magical means of flight negate this. \par
    \textbf{\textsc{underwater}} Creatures that do not have a swim speed have disadvantage on melee attacks not made with a dagger, shortsword, spear, or trident. Ranged weapons cannot hit beyond their normal range, and have disadvantage unless they are crossbows, nets, or javelin-type throwing weapons. Creatures immersed in water have resistance to fire damage. \par
    \textbf{\textsc{mounted}} A willing creature that is one size larger than you and physically capable of carrying you can serve as a mount. You can mount or dismount a creature within 5 feet of you once during your move, though this costs half your movement speed. If an effect moves your mount against its will or you are knocked prone while you are mounted, make a DC 10 Dexterity save or be thrown off. You have advantage on this check if using a saddle. If your mount is knocked prone, you may take a reaction to land on your feet; otherwise, you fall prone within 5 feet of your mount. A mount that is not acting independently moves as you direct it, and may take the Dash, Disengage, and Dodge actions. A controlled mount can act on the turn you mount it. If the mount provokes an opportunity attack while you’re on it, the attacker can choose to either target you or the mount.
}

\newcommand{\concentrationTable}{
    Normal activities such as moving or attacking do not interfere
    with concentration. Concentration breaks if you:
    \begin{itemize}[leftmargin=1em,topsep=0pt,noitemsep]
        \item \textbf{\textsc{cast another spell that requires concentration}}
        \item \textbf{\textsc{take damage}} Constitution saving throw (DC 8 + damage taken) to maintain concentration. Make a separate save for each source of damage.
        \item \textbf{\textsc{are incapacitated or killed}}
        \item \textbf{\textsc{are startled or distracted}} DC 10 Constitution saving throw to maintain concentration.
    \end{itemize}
}

\newcommand{\spellcastingTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \textbf{\textsc{spellcasting focus}} Can replace material component. Holy symbol must be held or worn visibly. \par
    \textbf{\textsc{components}}
    \begin{itemize}[leftmargin=1em,topsep=-4pt,noitemsep]
        \item \textbf{\textsc{verbal (v)}} Cannot cast while gagged
        or in area of silence.
        \item \textbf{\textsc{somatic (s)}} Must have free use of at
        least one hand to perform gestures.
        \item \textbf{\textsc{material (m)}} Must have specific components required by the spell on their person. If components are consumed by the spell, must provide enough components for each casting. Must have one hand free to access the components.
    \end{itemize}
    \vskip 4pt
    \textbf{\textsc{clear path to target}} Target cannot be behind total cover. If you try to cast an area of effect spell with something in the way, the area of effect begins on the near side of the obstruction.
}

\newcommand{\damageTypesTable}{
    \vskip 0.4em
    \begin{itemize}[leftmargin=1em,noitemsep]
        \raggedright
        \item \textbf{\textsc{acid}} corrosion
        \item \textbf{\textsc{bludgeoning}} falling, blunt force
        \item \textbf{\textsc{cold}}
        \item \textbf{\textsc{fire}}
        \item \textbf{\textsc{force}} magical energy
        \item \textbf{\textsc{lightning}}
        \item \textbf{\textsc{necrotic}} undead
        \item \textbf{\textsc{piercing}} puncturing and impaling
        \item \textbf{\textsc{poison}} venomous, toxic
        \item \textbf{\textsc{psychic}} mental abilities
        \item \textbf{\textsc{radiant}} celestial
        \item \textbf{\textsc{slashing}} blades, claws
        \item \textbf{\textsc{thunder}} concussive sound burst
    \end{itemize}
}

%%%%%%%%%% WEAPONS AND ARMOR %%%%%%%%%%

\newcommand{\armorTable}{
    \setlength{\tabcolsep}{0.25em}
    \Large{\textsc{\sffamily{light armor}}} \par
    \small
    \begin{tabularx}{\linewidth}{lcclcc}
        \textbf{\textsc{name}} & \textbf{\textsc{ac}} & \textbf{\textsc{str}} & \textbf{\textsc{stealth}} & \textbf{\textsc{cost}} & \textbf{\textsc{wt}} \\
        Padded & 11 + DEX & --- & Disad & 5 gp & 8  \\
        Leather & 11 + DEX & --- & --- & 10 gp & 10  \\
        Studded leather & 12 + DEX & --- & --- & 45 gp & 13 
    \end{tabularx}
    \vskip 0.4em
    \Large{\textsc{\sffamily{medium armor}}} \par
    \small
    \begin{tabularx}{\linewidth}{lcclcc}
        \textbf{\textsc{name}} & \textbf{\textsc{ac}} & \textbf{\textsc{str}} & \textbf{\textsc{stealth}} & \textbf{\textsc{cost}} & \textbf{\textsc{wt}} \\
        Hide & 12 + DEX (max 2) & --- & --- & 10 gp & 12  \\
        Chain shirt & 13 + DEX (max 2) & --- & --- & 50 gp & 20  \\
        Scale mail & 14 + DEX (max 2) & --- & Disad & 50 gp & 45  \\
        Breastplate & 14 + DEX (max 2) & --- & --- & 400 gp & 20  \\
        Half plate & 15 + DEX (max 2) & --- & Disad & 750 gp & 40  \\
    \end{tabularx}
    \vskip 0.4em
    \Large{\textsc{\sffamily{heavy armor}}} \par
    \small
    \begin{tabularx}{\linewidth}{lcclcc}
        \textbf{\textsc{name}} & \textbf{\textsc{ac}} & \textbf{\textsc{str}} & \textbf{\textsc{stealth}} & \textbf{\textsc{cost}} & \textbf{\textsc{wt}} \\
        Ring mail & 14 & --- & Disad & 30 gp & 40  \\
        Chain mail & 16 & 13 & Disad & 75 gp & 55  \\
        Splint & 17 & 15 & Disad & 200 gp & 60  \\
        Plate & 18 & 15 & Disad & 1500 gp & 65  \\
    \end{tabularx}
    \vskip 0.4em
    \Large{\textsc{\sffamily{other}}} \par
    \small
    \begin{tabularx}{\linewidth}{lcclcc}
        \textbf{\textsc{name}} & \textbf{\textsc{ac}} & \textbf{\textsc{str}} & \textbf{\textsc{stealth}} & \textbf{\textsc{cost}} & \textbf{\textsc{wt}} \\
        Unarmored & 10 + DEX & --- & --- & --- & --- \\
        Shield & +2 & --- & --- & 10 gp & 6  \\
    \end{tabularx}
}

\newcommand{\weaponsTable}{
    \setlength{\tabcolsep}{0.25em}
    \Large{\textsc{\sffamily{simple melee weapons}}} \par
    \small
%    \vskip 0.4em
    \begin{tabularx}{\linewidth}{lccllccl}
%    \begin{tabularx}{\textwidth}{lccllcc >{\raggedright\arraybackslash}X}
        \textbf{\textsc{name}} & \textbf{\textsc{reach}} & \textbf{\textsc{range}} & \textbf{\textsc{attack}} & \textbf{\textsc{damage}} & \textbf{\textsc{cost}} & \textbf{\textsc{wt}} & \textbf{\textsc{properties}} \\
        Club & 5 ft. & --- & STR + PB & 1d4 B & 1 sp & 2  & Light \\
        Dagger & 5 ft. & 20/60  & STR/DEX + PB & 1d4 P & 2 gp & 2  & Finesse, light, thrown \\
        Greatclub & 5 ft. & --- & STR + PB & 1d8 B & 2 sp & 10  & 2H \\
        Handaxe & 5 ft. & 20/60 & STR + PB & 1d6 S & 5 gp & 10  & Light, thrown \\
        Javelin & 5 ft. & 30/120 & STR + PB & 1d6 P & 5 sp & 2  & Thrown \\
        Light hammer & 5 ft. & 20/60 & STR + PB & 1d4 B & 2 gp & 2  & Light, thrown \\
        Mace & 5 ft. & --- & STR + PB & 1d6 B & 5 gp & 4  & --- \\
        Quarterstaff & 5 ft. & --- & STR + PB & 1d6 B & 2 sp & 4  & Versatile (1d8) \\
        Sickle & 5 ft. & --- & STR + PB & 1d4 S & 1 gp & 2  & Light \\
        Spear & 5 ft. & 20/60 & STR + PB & 1d6 P & 1 gp & 3  & Thrown, versatile (1d8)
    \end{tabularx}
    \vskip 0.4em
    \Large{\textsc{\sffamily{simple ranged weapons}}} \par
    \small
%    \vskip 0.4em
    \begin{tabularx}{\linewidth}{lccllccl}
%    \begin{tabularx}{\textwidth}{lccllcc >{\raggedright\arraybackslash}X}
        \textbf{\textsc{name}} & \textbf{\textsc{reach}} & \textbf{\textsc{range}} & \textbf{\textsc{attack}} & \textbf{\textsc{damage}} & \textbf{\textsc{cost}} & \textbf{\textsc{wt}} & \textbf{\textsc{properties}} \\
        Crossbow, light & --- & 80/120 & DEX + PB & 1d4 B & 25 gp & 5  & Amm., loading, 2H \\
        Dart & --- & 20/60 & STR/DEX + PB & 1d4 P & 5 cp & 1/4  & Finesse, thrown \\
        Shortbow & --- & 80/320 & DEX + PB & 1d6 P & 25 gp & 2  & Amm., 2H \\
        Sling & --- & 30/120 & DEX + PB & 1d4 B & 1 sp & --- & Amm. \\
    \end{tabularx}
    \vskip 0.4em
    \Large{\textsc{\sffamily{martial melee weapons}}} \par
    \small
%    \vskip 0.4em
    \begin{tabularx}{\linewidth}{lccllccl}
%    \begin{tabularx}{\textwidth}{lccllcc >{\raggedright\arraybackslash}X}
        \textbf{\textsc{name}} & \textbf{\textsc{reach}} & \textbf{\textsc{range}} & \textbf{\textsc{attack}} & \textbf{\textsc{damage}} & \textbf{\textsc{cost}} & \textbf{\textsc{wt}} & \textbf{\textsc{properties}} \\
        Battleaxe & 5 ft. & --- & STR + PB & 1d8 S & 10 gp & 4  & Versatile (1d10) \\
        Flail & 5 ft. & --- & STR + PB & 1d8 B & 10 gp & 2  & --- \\
        Glaive & 10 ft. & --- & STR + PB & 1d10 S & 20 gp & 6  & Heavy, reach, 2H \\
        Greataxe & 5 ft. & --- & STR + PB & 1d12 S & 30 gp & 7  & Heavy, 2H \\
        Greatsword & 5 ft. & --- & STR + PB & 2d6 S & 50 gp & 6  & Heavy, 2H \\
        Halberd & 10 ft. & --- & STR + PB & 1d10 S & 20 gp & 6  & Heavy, reach, 2H \\
        Lance & 10 ft. & --- & STR + PB & 1d12 P & 10 gp & 6  & Reach, special, 2H \\
        Longsword & 5 ft. & --- & STR + PB & 1d8 S & 15 gp & 3  & Versatile (1d10) \\
        Maul & 5 ft. & --- & STR + PB & 2d6 B & 10 gp & 10  & Heavy, 2H \\
        Morningstar & 5 ft. & --- & STR + PB & 1d8 P & 15 gp & 4  & --- \\
        Pike & 10 ft. & --- & STR + PB & 1d10 P & 5 gp & 18  & Heavy, reach, 2H\\
        Rapier & 5 ft. & --- & STR/DEX + PB & 1d8 P & 25 gp & 2  & Finesse \\
        Scimitar & 5 ft. & --- & STR/DEX + PB & 1d6 S & 25 gp & 3  & Finesse, light \\
        Shortsword & 5 ft. & --- & STR/DEX + PB & 1d6 P & 10 gp & 2  & Finesse, light \\
        Trident & 5 ft. & 20/60 & STR + PB & 1d6 P & 5 gp & 4  & Versatile (1d8) \\
        War pick & 5 ft. & --- & STR + PB & 1d8 P & 5 gp & 2  & --- \\
        Warhammer & 5 ft. & --- & STR + PB & 1d8 B & 15 gp & 2  & Versatile (1d10) \\
        Whip & 10 ft. & --- & STR/DEX + PB & 1d4 S & 2 gp & 3  & Finesse, reach \\
    \end{tabularx}
    \vskip 0.4em
    \Large{\textsc{\sffamily{martial ranged weapons}}} \par
    \small
%    \vskip 0.4em
    \begin{tabularx}{\linewidth}{lccllccl}
%    \begin{tabularx}{\textwidth}{lccllcc >{\raggedright\arraybackslash}X}
        \textbf{\textsc{name}} & \textbf{\textsc{reach}} & \textbf{\textsc{range}} & \textbf{\textsc{attack}} & \textbf{\textsc{damage}} & \textbf{\textsc{cost}} & \textbf{\textsc{wt}} & \textbf{\textsc{properties}} \\
        Blowgun & --- & 25/100 & DEX + PB & 1 P & 10 gp & 1  & Amm., loading \\
        Crossbow, hand & --- & 30/120 & DEX + PB & 1d6 P & 75 gp & 3  & Amm., light, loading \\
        Crossbow, heavy & --- & 100/400 & DEX + PB & 1d10 P & 50 gp & 18  & Amm., heavy, loading, 2H \\
        Longbow & --- & 150/600 & DEX + PB & 1d8 P & 50 gp & 2  & Amm., heavy, 2H \\
        Net & --- & 5/15  & DEX + PB & --- & 1 gp & 3  & Special, thrown \\
    \end{tabularx}
    \vskip 0.4em
    \Large{\textsc{\sffamily{other}}} \par
    \small
    \begin{tabularx}{\linewidth}{lccllccl}
        \textbf{\textsc{name}} & \textbf{\textsc{reach}} & \textbf{\textsc{range}} & \textbf{\textsc{attack}} & \textbf{\textsc{damage}} & \textbf{\textsc{cost}} & \textbf{\textsc{wt}} & \textbf{\textsc{properties}} \\
        Unarmed & 5 ft. & --- & STR + PB & 1 + STR B & --- & --- & --- \\
        Improvised, melee & 5 ft. & --- & STR + PB & 1d4 & --- & --- & --- \\
        Improvised, ranged & --- & 20/60 & DEX + PB & 1d4 & --- & --- & ---
    \end{tabularx}
}

\newcommand{\weaponPropertiesTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \textbf{\textsc{ammunition}} Expend ammunition to attack. Use 1 minute after battle ends to recover half expended ammunition. Treat as improvised weapon when used for melee attacks. Sling must always be loaded to use. \par
    \textbf{\textsc{finesse}} Choose STR or DEX modifier for attack and damage rolls. Must use same modifier for both. \par
    \textbf{\textsc{heavy}} Small creatures have disadvantage. \par
    \textbf{\textsc{light}} Can be used for two-weapon fighting. \par
    \textbf{\textsc{loading}} Fire only one piece of ammunition regardless of how many attacks you can normally make. \par
    \textbf{\textsc{range}} First number = normal range; second number = long range. Disadvantage on attacks over normal range. Cannot attack over long range. \par
    \textbf{\textsc{reach}} Adds 5 ft. to melee reach, including opportunity attacks. \par
    \textbf{\textsc{special}} Special rules. See PHB p. 148. \par
    \textbf{\textsc{thrown}} Make ranged attack with melee weapond. Use melee ability modifier. \par
    \textbf{\textsc{two-handed}} Requires two hands to attack. \par
    \textbf{\textsc{versatile}} Can attack one-handed or two-handed. \par
}


%%%%%%%%%% CURSE OF STRAHD CONTENT %%%%%%%%%%

\newcommand{\areasByLevel}{
    \setlength{\tabcolsep}{0.25em}
    \begin{tabularx}{\textwidth}{c >{\raggedright\arraybackslash}X c}
        \textbf{\textsc{lvl}} & \textbf{\textsc{area}} & \textbf{\textsc{ch}} \\
        3 & Village of Barovia & 3 \\
        4 & Town of Vallaki & 5 \\
        4 & Old Bonegrinder & 6 \\
        5 & Village of Krezk & 8 \\
        5 & Wizard of Wines Winery & 12 \\
        6 & Van Richten's Tower & 11 \\
        6 & Yester Hill & 14 \\
        7 & Argynvostholt & 7 \\
        7 & Werewolf Den & 15 \\
        8 & Tsolenka Pass & 9 \\
        8 & The Ruins of Berez & 10 \\
        9 & Castle Ravenloft & 4 \\
        9 & The Amber Temple & 13
    \end{tabularx}
}

\newcommand{\barovianLore}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \textbf{\textsc{the devil strahd}}
    \begin{itemize}[leftmargin=1.5em,topsep=0pt,noitemsep]
        \item Strahd von Zarovich is a vampire, and he dwells in Castle Ravenloft. No one is welcome at the castle.
        \item The devil Strahd is a curse placed on the land because of a forgotten sin of the Barovians' ancestors. (Untrue, but Barovians believe it nonetheless.)
        \item A vampire must rest in its coffin during the day. At night, it can summon wolves and vermin to do its bidding.
        \item A vampire can transform into a bat, a wolf, or a cloud of mist. In its humanoid form, it can dominate you with its powerful gaze.
        \item A vampire can't enter a residence without an invitation from one of the occupants.
        \item Running water burns a vampire like acid, and sunlight causes a vampire to burst into flame.
    \end{itemize}

    \textbf{\textsc{the land of barovia}}
    \begin{itemize}[leftmargin=1.5em,topsep=0pt,noitemsep]
        \item Anyone who attempts to leave the land of Barovia begins to choke on the fog. Those who don't turn back perish.
        \item Many strangers have been drawn to Barovia over the years, but they all die or disappear before long. Wolves, dire wolves, and werewolves prowl the Svalich Woods, and hungry bats fill the skies at night.
        \item The village of Barovia sits at the east end of the valley. Burgomaster: Kolyan Indirovich.
        \item The town of Vallaki lies in the heart of the valley. Burgomaster: Baron Vargas Vallakovich.
        \item The fortified village of Krezk lies at the west end of the valley and is built around an old abbey. Burgomaster: Dmitri Krezkov.
        \item Wine is the lifeblood of Barovia---for some, it is the only reason to keep living. Barovian taverns get their wine from the Wizard of Wines winery near Krezk.
        \item A mad wizard of great power haunts the foothills of Mount Baratok. He is an outsider and no friend of the vampire's.
    \end{itemize}

    \textbf{\textsc{beliefs and superstitions}}
    \begin{itemize}[leftmargin=1.5em,topsep=0pt,noitemsep]
        \item Two divine forces watch over the Barovian people: the Morninglord and Mother Night.
        \item Before the curse of Strahd befell the land, the Morninglord watched over the Barovian people from sunrise until sundown. Now, the sun has not shone unobscured for centuries, and the Morninglord no longer answers their prayers.
        \item The presence of Mother Night is felt most strongly between dusk and dawn, although nighttime prayers to her go unanswered. It is widely believed that she has forsaken the Barovian people and sent the devil Strahd to punish them for their ancestors' offenses.
        \item Spirits drift along the Old Svalich Road toward Castle Ravenloft in the dead of night. These phantoms are all that remain of Strahd's enemies, and this damnable fate awaits anyone who opposes him.
        \item The Vistani serve the devil Strahd. They alone are allowed to leave Barovia.
        \item Never harm a raven, lest ill fortune befall you!
    \end{itemize}
}

\newcommand{\vistaniLore}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \textbf{\textsc{strahd von zarovich}}
    \begin{itemize}[leftmargin=1.5em,topsep=0pt,noitemsep]
        \item Strahd comes from a royal bloodline. He died centuries ago yet endures as one of the undead, feasting on the blood of the living. Barovians refer to him as ``the devil Strahd.''
        \item Strahd has taken many consorts, but he has known only one true love: a Barovian peasant girl named Tatyana. (The Vistani don't know what happened to her.)
        \item Strahd named his castle, Ravenloft, after his beloved mother, Queen Ravenovia. Strangers aren't welcome at the castle without an invitation.
    \end{itemize}
    \textbf{\textsc{the land of barovia}}
    \begin{itemize}[leftmargin=1.5em,topsep=0pt,noitemsep]
        \item Strahd conquered this land centuries ago and named it after his father, King Barov. Strahd uses wolves, bats, and other creatures to spy on all of his realm.
        \item Barovians are simple, frightened people. Some have old souls, but many do not. The soulless ones are easy to spot, for they know nothing but fear. They have no charm, hope, or spark, and they don't cry.
        \item The Old Svalich Road passes through Strahd's domain. Three settlements lie on the road like beads on a string: Krezk to the west, Vallaki in the heart of the valley, and Barovia to the east. Strahd has spies in each settlement.
        \item There's an old windmill on the road between the village ofBarovia and the town ofVallaki. It should be avoided at all costs! (The Vistani refuse to say more.)
        \item It is wise to stick to the road. Wild druids, wayward ghosts, and packs of wolves and werewolves haunt the Svalich Woods.
    \end{itemize}
    \textbf{\textsc{beliefs and superstitions}}
    \begin{itemize}[leftmargin=1.5em,topsep=0pt,noitemsep]
        \item The souls of those who die in Barovia can't escape to the afterlife. They are prisoners in Strahd's domain.
        \item Some Vistani women are blessed with prescience. Of all the great Vistani fortune-tellers, none compares to Madam Eva. If knowledge of the future is what you seek, Madam Eva will tell you your fate.
        \item A prescient Vistana can't see her own future or the future of another Vistana. It is the burden of the Vistani's great gift that their own fates can't be divined.
        \item Vistani curses are potent, but they are invoked with great caution. Vistani know that to curse one who is undeserving of such punishment can have grave consequences for the one who utters such a curse.
        \item Ravens carry lost souls within them, so killing one is bad luck. (The ravens don't carry souls within.)
    \end{itemize}
}

\newcommand{\vallakiLore}{
    In addition to the information known to all Barovians, Vallakians know the following bits of local lore:
    \begin{itemize}[leftmargin=1.5em,topsep=0pt,noitemsep]
        \item The Blue Water Inn offers food, wine, and shelter to visitors. A stranger with pointed ears is staying there. He came to Barovia from a distant land, riding into town on a carnival wagon.
        \item The burgomaster, Baron Vargas Vallakovich, has decreed that the Festival of the Blazing Sun will be held in the town square in three days. The previous festival, which he called the Wolf's Head Jamboree, was less than a week ago.
        \item Vallaki has endured at least one festival every week for the past several years. Some Vallakians believe that the festivals keep the devil Strahd at bay. Others think they provide no protection or benefit whatsoever. Most consider them dismal affairs.
        \item Those who speak ill of the festivals are declared by the burgomaster to be in league with the devil Strahd and arrested. Some are thrown in the stocks, while others are taken to the burgomaster's mansion so that the baron can purge them of their evil.
        \item The burgomaster's henchman, Izek Strazni, has a history of violence as well as a fiendish deformity: a monstrous arm with which he can conjure fire. Fear of Izek keeps the baron's enemies at bay.
        \item No one hates the burgomaster more than Lady Fiona Wachter, who is often quoted as saying, ``I'd rather serve the devil than a madman.'' She owns an old house in town but rarely leaves her estate. Her two adult sons, Nikolai and Karl, are local troublemakers. Lady Wachter also has a mad daughter whom she keeps locked away. The burgomaster doesn't confront Fiona or her offspring because he is afraid of Lady Wachter, whose family has old ties to Strahd.
        \item Purple flashes of light have been seen emanating from the attic of the burgomaster's mansion.
        \item Wolves and dire wolves prowl the woods and aren't afraid to attack travelers on the Old Svalich Road. Well-armed groups of hunters and trappers have managed to kill several of the wolves, but more keep coming.
        \item There have been no recent sightings of the Mad Mage of Mount Baratok. Folks used to see him skulking along the north shore of Lake Zarovich, shooting lightning bolts into the water to kill the fish.
        \item There's a Vistani camp in the woods southwest of town. The Vistani there aren't very friendly. Vistani aren't welcome in Vallaki.
        \item West of town is a haunted mansion (Argynvostholt). Legend has it that a dragon died there long, long ago.
        \item South of town is a village that has been abandoned for decades. Its burgomaster committed some terrible offense and incurred the wrath of Strahd.
    \end{itemize}
}

\newcommand{\krezkLore}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    In addition to the information known to all Barovians, Krezkites know the following bits of local lore:
    \begin{itemize}[leftmargin=1.5em,topsep=0pt,noitemsep]
        \item Residents never leave the village for fear of being attacked by wolves, dire wolves, and werewolves.
        \item About once a month, a wagonload of wine arrives from the Wizard of Wines, the winery and vineyard to the south. The business is owned and operated by the Martikov family.
        \item Burgomaster Krezkov recently lost his fourteen-year-old son, Ilya, to illness. Ilya was the last of the four Krezkov children.
        \item A pool at the north end of the village provides fresh water throughout the year. Next to the pool, the village's ancestors built a shrine to the Morninglord in a gazebo. It's known as the Shrine of the White Sun.
        \item The Abbey of Saint Markovia is named after a priest of the Morninglord who took a stand against the devil Strahd. After a fierce uprising, Markovia and her most loyal followers stormed Castle Ravenloft, only to be destroyed.
        \item The abbey was once a hospital and a convent, but it fell on hard times after the land was swallowed up by the mists. Some of the clergy fell prey to Strahd, while others went mad and either starved themselves to death or turned to cannibalism.
        \item The head of the abbey, called simply the Abbot, arrived over a century ago and hasn't aged a day since. He occasionally visits the Shrine of the White Sun but doesn't talk much, and he demands tribute in the form of wine. No one knows his true name or where he came from, and many believe he's Strahd's servant or the vampire himself in disguise.
        \item No one from the village visits the abbey anymore. The abbey's bell rings at odd times, day and night, and the place is filled with baleful screams and horrible, inhuman laughter that can be heard throughout the village.
    \end{itemize}
}

\newcommand{\baroviaRandomEncountersTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \setlength{\tabcolsep}{0.25em}
    \small
    On a road, encounter occurs on a d20 roll of 18+; in the wilderness, encounter occurs on a d20 roll of 15+. Check every 30 minutes spent outdoors. Don't check after 2 encounters in past 12 hours. \par
    \begin{minipage}[t]{0.5\textwidth}
        \Large{\textsc{\sffamily{daytime encounters}}} \par
        \small
        \vskip 0.4em
        \begin{tabularx}{\textwidth}{c >{\raggedright\arraybackslash}X}
            \textbf{d12+d8} & \textbf{\textsc{encounter}}  \\
            2 & 3d6 Barovian commoners \\
            3 & 1d6 Barovian scouts \\
            4 & Hunting trap \\
            5 & Grave \\
            6 & False trail \\
            7 & 1d4+1 Vistani bandits \\
            8 & Skeletal rider \\
            9 & Trinket \\
            10 & Hidden bundle \\
            11 & 1d4 swarms of ravens (50\%) or 1 wereraven (raven form) (50\%) \\
            12 & 1d6 dire wolves \\
            13 & 3d6 wolves \\
            14 & 1d4 berserkers \\
            15 & Corpse \\
            16 & 1d6 werewolves (human form) \\
            17 & 1 druid + 2d6 twig blights \\
            18 & 2d4 needle blights \\
            19 & 1d6 scarecrows \\
            20 & 1 revenant \\
        \end{tabularx}
    \end{minipage}
    \begin{minipage}[t]{0.5\textwidth}
        \Large{\textsc{\sffamily{nighttime encounters}}} \par
        \vskip 0.4em
        \small
        \begin{tabularx}{\textwidth}{c >{\raggedright\arraybackslash}X}
            \textbf{d12+d8} & \textbf{\textsc{encounter}}  \\
            2 & 1 ghost \\
            3 & Hunting trap \\
            4 & Grave \\
            5 & Trinket \\
            6 & Corpse \\
            7 & Hidden bundle \\
            8 & Skeletal rider \\
            9 & 1d8 swarms of bats \\
            10 & 1d6 dire wolves \\
            11 & 3d6 wolves \\
            12 & 1d4 berserkers \\
            13 & 1 druid + 2d4 twig blights \\
            14 & 2d4 needle blights \\
            15 & 1d6 werewolves (wolf form) \\
            16 & 3d6 zombies \\
            17 & 1d6 scarecrows \\
            18 & 1d8 Strahd zombies \\
            19 & 1 will-o'-wisp \\
            20 & 1 revenant \\
        \end{tabularx}
    \end{minipage}
}

\newcommand{\baroviaRandomHouseOccupants}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \begin{tabularx}{\textwidth}{c >{\raggedright\arraybackslash}X}
        \textbf{d20} & \textbf{\textsc{occupants}}  \\
        1--3 & None \\
        4--8 & 2d4 swarms of rats \\
        9--16 & Barovian villagers \\
        17--20 & 2d4 Strahd zombies
    \end{tabularx}
}

\newcommand{\landsOfBaroviaFeatures}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \textbf{\textsc{doors}}  DC 10 Strength check to force a wooden door; DC 15 if the door is barred or reinforced. +5 DC for stone door; +10 DC for iron door. -5 DC for glass/amber or if the door is weakened.  \par
    \textbf{\textsc{secret doors}} PP 15 to notice secret door if there are obvious clues.  Otherwise, DC 15 Perception check with active search.  \par
    \textbf{\textsc{locks}} DC 15 Dexterity check + thieves' tools to pick a typical lock. DC 20 Strength check to smash with bludgeoning or slashing weapon. \par
    \textbf{\textsc{webs}} Ordinary webs, including thick cobwebs, don't restrain or slow down PCs. PC can clear away the cobwebs from a 10-foot square as an action. Webs woven by giant spiders are a different matter; see DMG p. 105.
}

\newcommand{\ravenloftRandomEncountersTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \setlength{\tabcolsep}{0.25em}
    \small
    Roll d20; encounter occurs on 18+. Check for encounter the first time PCs enter an unoccupied area and every 10 minutes spent resting. \par
    \begin{tabularx}{\textwidth}{c >{\raggedright\arraybackslash}X}
        \textbf{d12+d8} & \textbf{\textsc{encounter}}  \\
        2 & Ezmerelda d'Avenir \\
        3 & Rahadin \\
        4 & 1 black cat \\
        5 & 1 broom of animated attack \\
        6 & 1d4+1 flying swords \\
        7 & Blinksy toy \\
        8 & Unseen servant \\
        9 & 1d4 Barovian commoners \\
        10 & 2d6 crawling claws \\
        11 & 1d6 shadows \\
        12 & 1d6 swarms of bats \\
        13 & 1 crawling Strahd zombie \\
        14 & 1d4+1 Vistani thugs \\
        15 & 1d4 wights \\
        16 & Trinket \\
        17 & Giant spider cocoon \\
        18 & 1 Barovian witch \\
        19 & 1d4+1 vampire spawn \\
        20 & Strahd von Zarovich \\
    \end{tabularx}
}

\newcommand{\randomBooksTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \setlength{\tabcolsep}{0.25em}
    \begin{tabularx}{\textwidth}{c >{\raggedright\arraybackslash}X}
        \textbf{d12} & \textbf{\textsc{book}}  \\
        1 & Alchemist's tome \\
        2 & Bestiary of strange beasts \\
        3 & Biography of a forgotten king or queen \\
        4 & Book of exotic recipes \\
        5 & Book of heraldry \\
        6 & Book of military strategy \\
        7 & Epic novel \\
        8 & Guide to fine wines \\
        9 & Heretical text \\
        10 & Historical text \\
        11 & Poetry anthology \\
        12 & Theological text
    \end{tabularx}
}

\newcommand{\gothicTrinketsTable}{
    \setlength{\parskip}{0.4em}
    \setlength{\parindent}{0em}
    \setlength{\tabcolsep}{0.25em}
    \begin{tabularx}{\textwidth}{c >{\raggedright\arraybackslash}X}
        \textbf{d100} & \textbf{\textsc{trinket}}  \\
        01-02 & A picture you drew as a child of your imaginary friend \\
        03-04 & A lock that opens when blood is dripped in its keyhole \\
        05-06 & Clothes stolen from a scarecrow \\
        07-08 & A spinning top carved with four faces: happy, sad, wrathful, and dead \\
        09-10 & The necklace of a sibling who died on the day you were born \\
        11-12 & A wig from someone executed by beheading \\
        13-14 & An unopened letter to you from your dying father \\
        15-16 & A pocket watch that runs backward for an hour every midnight \\
        17-18 & A winter coat stolen from a dying soldier \\
        19-20 & A bottle of invisible ink that can only be read at sunset \\
        21-22 & A wineskin that refills when interred with a dead person for a night \\
        23-24 & A set of silverware used by a king for his last meal \\
        25-26 & A spyglass that always shows the world suffering a terrible storm \\
        27-28 & A cameo with the profile's face scratched away \\
        29-30 & A lantern with a black candle that never runs out and that burns with green flame \\
        31-32 & A teacup from a child's tea set, stained with blood \\
        33-34 & A little black book that records your dreams, and yours alone, when you sleep \\
        35-36 & A necklace formed of the interlinked holy symbols of a dozen deities \\
        37-38 & A hangman's noose that feels heavier than it should \\
        39-40 & A birdcage into which small birds fly but once inside, never eat or leave \\
        41-42 & A lepidopterist's box filled dead moths with skull-like patterns on their wings \\
        43-44 & A jar of pickled ghouls' tongues \\
        45-46 & The wooden hand of a notorious pirate \\
        47-48 & An urn with the ashes of a dead relative \\
        49-50 & A hand mirror backed with a bronze depiction of a medusa \\
        51-52 & Pallid leather gloves crafted with ivory fingernails \\
        53-54 & Dice made from the knuckles of a notorious charlatan \\
        55-56 & A ring of keys for forgotten locks \\
        57-58 & Nails from the coffin of a murderer \\
        59-60 & A key to the family crypt \\
        61-62 & A bouquet of funerary flowers that always looks and smells fresh \\
        63-64 & A switch used to discipline you as a child \\
        65-66 & A music box that plays by itself whenever someone holding it dances \\
        67-68 & A walking cane with an iron ferule that strikes sparks on stone \\
        69-70 & A flag from a ship lost at sea \\
        71-72 & A porcelain doll's head that always seems to be looking at you \\
        73-74 & A wolf's head wrought in silver that is also a whistle \\
        75-76 & A small mirror that shows a much older version of the viewer \\
        77-78 & Small, worn book of children's nursery rhymes \\
        79-80 & A mummified raven claw \\
        81-82 & A broken pendent of a silver dragon that's always cold to the touch \\
        83-84 & A small locked box that quietly hums a lovely melody at night, but you always forget it in the morning \\
        85-86 & An inkwell that makes one a little nauseous when staring at it \\
        87-88 & An old little doll made from a dark, dense wood and missing a hand and a foot \\
        89-90 &  A black executioner's hood \\
        91-92 & A pouch made of flesh with a sinew drawstring \\
        93-94 & A tiny spool of black thread that never runs out \\
        95-96 &  A tiny clockwork figure of a dancer that's missing a gear and doesn't work \\
        97-98 & A black wooden pipe that creates puffs of smoke that look like skulls \\
        99-00 & A vial of perfume, the scent of which only certain creatures can detect
    \end{tabularx}
}
