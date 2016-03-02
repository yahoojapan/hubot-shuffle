# hubot-shuffle
[![npm version](https://badge.fury.io/js/hubot-shuffle.svg)](https://badge.fury.io/js/hubot-shuffle)

hubot-shuffle add shuffle system.

* shuffle member.  ex) order of speeker
* pick a person. ex) chairperson, time-keeper
* build teams. ex) lunch, meeting

## Install

```bash
npm install --save hubot-shuffle
```

## Usage
### shuffle

```bash
hubot> hubot shuffle Jacob,Sophia,Mason,Emma,Ethan,Isabella,Noah,Olivia,William,Ava
hubot> Noah,Ava,Mason,Jacob,Emma,William,Olivia,Sophia,Ethan,Isabella

hubot> hubot shuffle Jacob,Sophia,Mason,Emma,Ethan,Isabella,Noah,Olivia,William,Ava
hubot> Isabella,Sophia,Mason,Jacob,Olivia,William,Ava,Noah,Emma,Ethan
```

### pick person(s)

```bash
hubot> hubot pick 1 from Jacob,Sophia,Mason,Emma,Ethan,Isabella,Noah,Olivia,William,Ava
hubot> Noah

hubot> hubot pick 1 from Jacob,Sophia,Mason,Emma,Ethan,Isabella,Noah,Olivia,William,Ava
hubot> Sophia

hubot> hubot pick 2 from Jacob,Sophia,Mason,Emma,Ethan,Isabella,Noah,Olivia,William,Ava
hubot> Isabella,Ava
```

### build teams
```bash
hubot> hubot build 3 teams from Jacob,Sophia,Mason,Emma,Ethan,Isabella,Noah,Olivia,William,Ava
hubot> Jacob,William,Ava,Ethan
Emma,Sophia,Noah,Mason
Olivia,Isabella

hubot> hubot build 4 teams from Jacob,Sophia
hubot> Jacob
Sophia


hubot>
```

## License
This software is released under the MIT License, see [LICENSE][license-file].

[license-file]: ./LICENSE
