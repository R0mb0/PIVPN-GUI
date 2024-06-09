# Application modules UML

I wanna treat the graphic part as a layer that interact with the others modules,
for this reason it will not be analyzed in this paper.

At the moment the project doesn't involves to manage a lot of users

## Functionality to implement

From the GUI I must be able to:

- Add new users and set a Time-To-Live for their connections (for example: Marco
   can use the VPN for 20 days)
- Retreive for every user the configuration file for the VPN
- Automatcly disable users with Time-To-Live = 0
- Display users status
- Manualy remove/disable Users

## UML scheme

```mermaid
%%{
  init: {
    'theme': 'base',
    'themeVariables': {
      'primaryColor': '#BB2528',
      'primaryTextColor': '#fff',
      'primaryBorderColor': '#7C0000',
      'lineColor': '#F8B229',
      'secondaryColor': '#006100',
      'tertiaryColor': '#fff'
    }
  }
}%%
graph TD;
    A{GUI} == Interact with ==> B[/Moderator/]
    A == Interact with ==> C[/Time module/]
    B == Interact with ==> D[CLI adapter]
    B == Interact with ==> E[Local database]
    E == Use ==> F[User]
```

## Single module scheme

```mermaid
%%{
  init: {
    'theme': 'base',
    'themeVariables': {
      'primaryColor': '#BB2528',
      'primaryTextColor': '#fff',
      'primaryBorderColor': '#7C0000',
      'lineColor': '#F8B229',
      'secondaryColor': '#006100',
      'tertiaryColor': '#fff'
    }
  }
}%%
graph TD;
    A{User} ==> B[Public attributes:  
                  - Name
                  - Start_date
                  - End_date
                  - Is_disabled
                  - Is_always_allowed]
```  

```mermaid
%%{
  init: {
    'theme': 'base',
    'themeVariables': {
      'primaryColor': '#BB2528',
      'primaryTextColor': '#fff',
      'primaryBorderColor': '#7C0000',
      'lineColor': '#F8B229',
      'secondaryColor': '#006100',
      'tertiaryColor': '#fff'
    }
  }
}%%
graph TD;
    A{Database} ==> B[Public methods:  
                  - Add_user
                  - Remove_user
                  - Get_user
                  - Get_all_users
                  - Write_database
                  - Load_database

                  Internal fields:
                  - A dictionary ]
```

```mermaid
%%{
  init: {
    'theme': 'base',
    'themeVariables': {
      'primaryColor': '#BB2528',
      'primaryTextColor': '#fff',
      'primaryBorderColor': '#7C0000',
      'lineColor': '#F8B229',
      'secondaryColor': '#006100',
      'tertiaryColor': '#fff'
    }
  }
}%%
graph TD;
    A{CLI adapter} ==> B[Public methods:  
                  - Add_user
                  - Remove_user
                  - Get_all_users
                  - Enable_user
                  - Disable_user]
```


```mermaid
%%{
  init: {
    'theme': 'base',
    'themeVariables': {
      'primaryColor': '#BB2528',
      'primaryTextColor': '#fff',
      'primaryBorderColor': '#7C0000',
      'lineColor': '#F8B229',
      'secondaryColor': '#006100',
      'tertiaryColor': '#fff'
    }
  }
}%%
graph TD;
    A{Mediator} ==> B[Public methods:  
                  - Add_user
                  - Remove_user
                  - Get_all_users
                  - Get_user
                  - Enable_user
                  - Disable_user
                  - Write_database
                  - Load_database]
```

```mermaid
%%{
  init: {
    'theme': 'base',
    'themeVariables': {
      'primaryColor': '#BB2528',
      'primaryTextColor': '#fff',
      'primaryBorderColor': '#7C0000',
      'lineColor': '#F8B229',
      'secondaryColor': '#006100',
      'tertiaryColor': '#fff'
    }
  }
}%%
graph TD;
    A{Time module} ==> B[To define]
```
