<p align="center">
<img src="https://raw.githubusercontent.com/xuzhongping/rusure/main/images/logo.png" title="rusure" width="557"/>
</p>

Add 'are you sure?' support for your shell interactive commands.

## Installation

### zsh

#### oh-my-zsh

* Clone the repository inside your oh-my-zsh repo:
  
        git clone https://github.com/xuzhongping/rusure.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/rusure

* Enable it in your `.zshrc` by adding it to your plugin list and reloading the completion:
  
        plugins=(… rusure)

## Usage

* Set the commands you need to prompt in the configuration file:
  
  > ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/rusure/zsh/config.yml
  
  ```yaml
  cmds:
    - rm -rf ~
    - git checkout .
  # - other cmd
  # You can customize your prompt text.
  ask: Are you sure?
  yes: Y
  no: N
  ```

* When you enter a command and press the Enter key, if it hits the setting, it will automatically add a pre-command to your command:
  
  ```shell
  > rm -rf ~
  ```
  
  after typing enter:
  
  ```shell
  > rusure_exec rm -rf ~
  are you sure?(Y/N):
  ```

* If you type in any combination of uppercase and lowercase of Y or YES, the original command will start to execute, otherwise it will be cancelled.
  
  ```shell
  > rusure_exec rm -rf ~
  are you sure?(Y/N):N
  canced!
  ```

* Of course, you can also explicitly type a pre-command to execute it:
  
  ```shell
  > rusure rm -rf ~
  ```

## Supported

- [x] zsh 
- [ ] other shell

## Author

👤 **nakahira**

* Website: [nakahira.cn](https://nakahira.cn)
* Github: [@xuzhongping](https://github.com/xuzhongping)

### Thanks

* [xiaochende](https://github.com/xiaochende)

## Show your support

Give a ⭐️ if this project helped you!

Currently we will only support zsh, and we hope it can be used in other shells too. If you can help, we are very welcome!


