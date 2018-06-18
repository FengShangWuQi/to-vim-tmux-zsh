
> # to-zsh

![zsh](../images/zsh.png)

# 非常棒的 shell，没理由再使用 bash

## 查看系统中内置的几种 shell
```
cat /etc/shells
```

## 设置 zsh 为默认 shell
```
chsh -s /bin/zsh
```

## 查看当前 shell
```
echo $SHELL
```

## 使用 oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## 修改 PS1
- 进入 agnoster 主题
- 删除 prompt_context
```
[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
