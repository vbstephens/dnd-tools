# dnd-tools

This is a set of scripts for creating nice-looking spell cards, monster cards, and/or item cards for D&D 5E using LuaLaTeX. 

Much of the original data comes from [Open5E via GitHub](https://github.com/eepMoody/open5e-api), and I use their basic format for JSON files, but most of the entries (particularly spell card descriptions) have been modified to make the formatting TeX-friendly. I have also added material from supplemental sources as needed. 

## Quick Reference: Commands

`\class{}`
  - Filters spell cards by class; options: `All`, `Artificer`, `Bard`, `Cleric`, `Druid`, `Paladin`, `Ranger`, `Sorcerer`, `Warlock`, `Wizard`
  - Example: `\class{Paladin}`
  - Options are case-sensitive
  - To build all spell cards for all classes, use `All` or leave blank

`\filterBySource{}`
  - Filters spell cards by their source; options: `All`, `PHB`, `TCoE`, `XGtE`, `SCoC`, `FToD`. See Acronyms section below.
  - Example: `\filterBySource{TCoE}`


`\makeSpellCards`
  - Builds your spell card set
  - `\class{}` and/or `\filterBySource{}` must come before `\makeSpellCards` to be applied

`\makeInfusionCards`
- Builds artificer infusion card set

`\makeMonsterCards{}`
- Builds monster cards from JSON file; argument is a filename, including .json extension
- Example: `\makeMonsterCards{monsters.json}`

### Notes

- Requires LuaLaTeX
- You may need to build cards twice to get intended spacing within and between info boxes, particularly on the spell cards
- `\filterBySource{}` does not get applied if you use `\class{All}`
- See `dnd-tool-test.tex` for usage examples

## Spell Cards

The spell cards are inspired by several DIY designs across the internet---but particularly [these](https://hardcodex.ru/)---with my own modifications. They were designed to be generated as 2.5x3.5in cards (about the size of a standard playing card), but you can change the card dimensions with the `geometry` command at the top of the .tex file.

The full list of spells, in JSON format, is in `spells.json`. To include additional spells, add them to `spells.json` in the prescribed format. 


### Colors
Each class's cards have a different colored background. To customize, modify the appropriate line under the "colors" heading near the beginning of `spell-cards.sty`. I advise relatively dark colors so that the white text is easy to read.

### Auxiliary stat blocks
Summoning-type spell cards automatically generate stat blocks for their associated creatures (or monsters or constructs or what have you). These are based directly on the monster card generator (see below), and I find it handy to print them back to back with their associated spell cards. Currently, there isn't a way to turn this feature off, but for now, you can simply not print those pages of the generated PDF.

## Monster Cards

Monster cards are my own design, but made to look and function similarly to the 5e stat blocks. They were designed to be generated as 3x5in cards (index card size), but you can change the card dimensions with the `geometry` command at the top of the .tex file.

These cards make use of the Mrs Eaves font for titles and headings. If you don't have access to it, you can specify a different font in the `\setsansfont{}` command near the top of the `dnd-tools.cls` file. If you do have access to Mrs Eaves, you may need to alter or remove the `MrsEaves.fontspec` file to meet your needs.

### Formatting options
There are two optional keys that can be added to any monster entry in the JSON file to tweak the formatting of the cards:

- `"tex_multiline": "true"` splits the AC/HP/Speed line underneath the title into two lines. Useful if the info is cramped onto one line or spills over undesirably.
- `"tex_twosided": "actions"` splits the stat block into two cards such that the second card (the backside, if you print them double-sided) begins with the Actions heading. This is most useful for monsters with a lot of abilities, but can be used for any monster.

## Artificer infusion cards

The artificer infusion cards are similar in look and feel to the spell cards and are intended for use alongside the artificer spell deck. Like the spell cards, they were designed to be generated as 2.5x3.5in cards (about the size of a standard playing card), but you can change the card dimensions with the `geometry` command at the top of the .tex file.

## Item Cards

In progress

## TO DO

### General

- Alter JSON format and card generation scripts so that JSON entries don't require TeX formatting commands inside them.

### Spell cards
- Make `\filterBySource{}` work if using `\class{All}`
- (MAYBE) Generate card sets based on various filters (level, school, etc.) in addition to character class.
- (QOL) Truncate description and refer to page number on cards with so much text that the font size is too small to read comfortably.
- (QOL) Add option to turn off generation of stat blocks associated with certain spell cards.
### Monster cards
- (MAYBE) Add additional `tex_twosided` options for card splits at other points. 
- Add commas to saving throws and skills lists.
- Consider different layout for AC/HP/Speed line.
- (MAYBE) Add filtering options.
- (MAYBE) Split shapechanger cards into front/back based on polymorph forms.
- (QOL)(MAYBE) Make templated list of common abilities and actions (e.g. Spider Climb, Multiattack, Slam, Claws).
- (QOL)(MAYBE) Put passive perception somewhere that's easier to see at a glance.
- {MAYBE} Add monster art for card backs.

## Acronyms

- ERLW = Eberron: Rising From The Last War
- DMG = Dungeon Master's Guide
- FToD = Fizban's Treasury of Dragons
- GGtR = Guildmaster's Guide to Ravnica
- MM = Monster Manual
- MPMoM = Mordenkainen Presents: Monsters of the Multiverse
- MToF = Mordenkainen's Tomb of Foes
- PHB = Player's Handbook
- SCoC = Strixhaven: A Curriculum of Chaos
- TCoE = Tasha's Cauldron of Everything
- VGtM = Volo's Guide to Monsters
- XGtE = Xanathar's Guide to Everything