本项目从 [ip_derper](https://github.com/yangchuansheng/ip_derper) 分支而来并独立维护。

# IP DERPer Plus

## 项目介绍

DERPer 是 Tailscale 的中转服务器，用于处理 Tailscale 客户端的连接请求、无法打洞时转为私有协议进行连接。

目前 Tailscale 官方提供了可用但不太稳定的 DERP 服务器，并允许用户使用自己的域名部署 DERP 服务器，但不是每个人都有空余的域名愿意用来部署
DERP 服务器，于是诞生了 ip_derper 项目。

> 若需要使用防盗功能，则必须有 net_admin 权限和 tun 设备。可惜的是，这在使用雨云云应用部署时是无法实现的。

## 使用方法

雨云免费一键部署（云应用不支持防盗，请看 README.md 的 NOTE 部分）

[![通过雨云一键部署](https://rainyun-apps.cn-nb1.rains3.com/materials/deploy-on-rainyun-cn.svg)](https://app.rainyun.com/apps/rca/store/7021/github_?s=github_app7021)

> Ads: 雨云优惠码 `github` 可享新用户 5 折优惠和永久折扣以及消费积分返利

您需要在 Tailscale 控制台生成一个脚本，并且将 `--auth-key` 后的内容复制下来，传入环境变量 `TS_AUTHKEY` 中即可。

![img.png](img/img.png)

| 环境变量名               | 默认值                              |
|---------------------|----------------------------------|
| DERP_ADDR           | :443                             |
| DERP_HTTP_PORT      | 80                               |
| DERP_HOST           | 127.0.0.1                        |
| DERP_CERTS          | /app/certs/                      |
| DERP_STUN           | true                             |
| DERP_STUN_PORT      | 3478                             |
| DERP_VERIFY_CLIENTS | false                            |
| TS_AUTHKEY          | ""                               |
| TS_STATE_DIR        | /var/lib/tailscale               |
| TS_EXTRA_ARGS       | "--advertise-tags=tag:container" |

## NOTE

尝试了多种方式都无法在雨云云应用环境启动 tailscale+derper 服务，目前带防盗功能的仅支持 vm 中部署或自有 k8s 中部署。
