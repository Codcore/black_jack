# Black Jack
1. [ ] **User** << **Player**
2. [ ] **Dealer** << **Player**
3. [x] **Player**
    1. [x] _has_ _**hand :**_ **Hand**
    2. [x] _has_ _**bank :**_ **Bank**
4. [x] **Card**
    1. [x] _has_ **_suit_**
    2. [x] _has_ **_value_**
5. [x] **CardDeck**
    1. [x] _has_ _**cards :**_  **[] of Card** 
    2. [x] _can_ _**shuffle_cards**_!
    3. [x] _can_ **_draw_card :_** **Card**
6. [x] **Hand**
    1. [x] _has_ _**cards :**_  **[] of Card** 
    2. [x] _can_ _**pull_card**_
    3. [x] _can be_ _**full?**_
7. [x] **Bank**
    1. [x] _has_ _**funds**_
    2. [x] _can_ _**bet**_
    3. [x] _can be_ _**empty?**_ 
8. [ ] **Interface** (View)
9. [ ] **Game** (Model)
    1. [ ] _has_ _**dealer :**_ **Dealer**
    2. [ ] _has_ **_user :_** **User**
    3. [ ] _has_ **_deck :_** **CardDeck**
    4. [ ] _has_ **_bank_** : **Bank**
10. [ ] **GameController** (Controller)
    1. [ ] **has** **_game :_** **Game**
    2. [ ] _has_ **_interface:_** **Interface**
    3. [ ] _can_ _**hand_out :**_ **Hand**
    4. [ ] _can_ _**deal**_
    5. [ ] _can_ _**skip_move**_
    6. [ ] _can_ _**make_move**_
