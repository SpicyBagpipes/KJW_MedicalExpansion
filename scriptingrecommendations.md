# Recommendations for Scripting

## VSCode:
[psioniq File Header:](https://marketplace.visualstudio.com/items?itemName=psioniq.psi-header) Useful for automatically generating file headers. Template found below. Navigate to extension settings, and place it in the templates.
<details>

<summary>Template</summary>

```json
{
    "language": "sqf",
    "template": [
        " Author: <<author>>",
        "",
        " Function description",
        "",
        " Arguments:",
        " 0: Objects <ARRAY>",
        " 1: All <BOOL>",
        "",
        " Return Value:",
        " None",
        "",
        " Example:",
        " [[bob, ted], false] call <<projectname>>_<<filenamebase>>",
        "",
        " Public: No"
    ]
}

```

</details>

[SQF-VM Language Server:](https://marketplace.visualstudio.com/items?itemName=SQF-VM.sqf-vm-language-server) A linter for SQF code. Use the pre-release version.

[SQF Wiki:](https://marketplace.visualstudio.com/items?itemName=EelisLynne.sqf-wiki) Easy lookup on the BIKI with only one keystroke required.

## Arma:
Enable filepatching! It allows you to place a directory within Arma's folder to quickly overwrite parts of this mod for development.

[Advanced Developer Tools:]("https://steamcommunity.com/sharedfiles/filedetails/?id=2369477168") Essential for scripting or config work in Arma.

[Anrop's ACE3 Dev build:]("https://steamcommunity.com/sharedfiles/filedetails/?id=1882627645") Incredibly useful for developing updates for next ACE update.