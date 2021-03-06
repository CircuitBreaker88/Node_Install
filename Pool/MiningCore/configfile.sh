#!/bin/bash
# Copyright (c) 2019 - 2020 Node_Install. Released under the MIT License.

# .-----------------. .----------------.  .----------------.  .----------------.                                                             
#| .--------------. || .--------------. || .--------------. || .--------------. |                                                            
#| | ____  _____  | || |     ____     | || |  ________    | || |  _________   | |                                                            
#| ||_   \|_   _| | || |   .'    `.   | || | |_   ___ `.  | || | |_   ___  |  | |                                                            
#| |  |   \ | |   | || |  /  .--.  \  | || |   | |   `. \ | || |   | |_  \_|  | |                                                            
#| |  | |\ \| |   | || |  | |    | |  | || |   | |    | | | || |   |  _|  _   | |                                                            
#| | _| |_\   |_  | || |  \  `--'  /  | || |  _| |___.' / | || |  _| |___/ |  | |                                                            
#| ||_____|\____| | || |   `.____.'   | || | |________.'  | || | |_________|  | |                                                            
#| |              | || |              | || |              | || |              | |                                                            
#| '--------------' || '--------------' || '--------------' || '--------------' |                                                            
# '----------------'  '----------------'  '----------------'  '----------------'                                                             
# .----------------.  .-----------------. .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
#| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
#| |     _____    | || | ____  _____  | || |    _______   | || |  _________   | || |      __      | || |   _____      | || |   _____      | |
#| |    |_   _|   | || ||_   \|_   _| | || |   /  ___  |  | || | |  _   _  |  | || |     /  \     | || |  |_   _|     | || |  |_   _|     | |
#| |      | |     | || |  |   \ | |   | || |  |  (__ \_|  | || | |_/ | | \_|  | || |    / /\ \    | || |    | |       | || |    | |       | |
#| |      | |     | || |  | |\ \| |   | || |   '.___`-.   | || |     | |      | || |   / ____ \   | || |    | |   _   | || |    | |   _   | |
#| |     _| |_    | || | _| |_\   |_  | || |  |`\____) |  | || |    _| |_     | || | _/ /    \ \_ | || |   _| |__/ |  | || |   _| |__/ |  | |
#| |    |_____|   | || ||_____|\____| | || |  |_______.'  | || |   |_____|    | || ||____|  |____|| || |  |________|  | || |  |________|  | |
#| |              | || |              | || |              | || |              | || |              | || |              | || |              | |
#| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
# '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 

cd ../../build
cat > config.json <<EOF

{
    "logging":{
       "level":"info",
       "enableConsoleLog":false,
       "enableConsoleColors":false,
       "logFile":"debug.log",
       "logBaseDirectory":"/root/logs/",
       "perPoolLogFile":true
    },
    "api": {
        "enabled": true,
        "listenAddress": "0.0.0.0",
        "port": 4000,
        "adminPort": 4010
    },
    "banning":{
       "manager":"integrated",
       "banOnJunkReceive":true,
       "banOnInvalidShares":false
    },
    "notifications":{
       "enabled":true,
       "email":{
          "host":"smtp.example.com",
          "port":587,
          "user":"user",
          "password":"passwordhere",
          "fromAddress":"info@yourpool.org",
          "fromName":"support"
       },
       "admin":{
          "enabled":false,
          "emailAddress":"user@example.com",
          "notifyBlockFound":true
       }
    },
    "persistence":{
       "postgres":{
          "host":"127.0.0.1",
          "port":5432,
          "user":"miningcore",
          "password":"passwordtodbhere",
          "database":"miningcore"
       }
    },
    "paymentProcessing":{
       "enabled":true,
       "interval":1800,
       "shareRecoveryFile":"recovered-shares.txt"
    },
    "pools":[
       {
          "id":"indexchain",
          "enabled":true,
          "coin":"indexchain",
          "address":"iQqK1tT8nzmD3hXPFHNbJaK9p6Sc4g61FV",
          "rewardRecipients":[
             {
                "address":"iGGnkyoVeBzmVmo4TaYrSKRAvroDLXtbgM",
                "percentage":1
             }
          ],
          "blockRefreshInterval":500,
          "jobRebroadcastTimeout":55,
          "clientConnectionTimeout":600,
          "banning":{
             "enabled":true,
             "time":600,
             "invalidPercent":50,
             "checkThreshold":50
          },
          "ports":{
             "6000":{
                "listenAddress": "0.0.0.0",
                "difficulty":30,
                "name":"GPU Mining",
                "varDiff": {
                  "minDiff": 1,
                  "targetTime": 5,
                  "retargetTime": 30,
                  "variancePercent": 50,
                  "maxDelta":"1"
              }
             }
          },
          "daemons":[
             {
                "host":"127.0.0.1",
                "port":8888,
                "user":"userhere",
                "password":"passhere"
             }
          ],
          "paymentProcessing":{
             "enabled":true,
             "minimumPayment":0.1,
             "payoutScheme":"PPLNS",
             "payoutSchemeConfig":{
                "factor":2.0
             }
          }
       },
       {
         "id":"devault",
         "enabled":false,
         "coin":"devault",
         "addressType": "CashAddr",
         "address":"devault:qqhndk6gns00as2t759y3hqrf396uhncxyf480qn37",
         "rewardRecipients":[
            {
               "address":"devault:qptdsugw4rd720kdydl45nmauu9g9yjrggye797ahs",
               "percentage":1
            }
         ],
         "blockRefreshInterval":500,
         "jobRebroadcastTimeout":55,
         "clientConnectionTimeout":600,
         "banning":{
            "enabled":true,
            "time":600,
            "invalidPercent":50,
            "checkThreshold":50
         },
         "ports":{
            "5000":{
               "listenAddress": "0.0.0.0",
               "difficulty":10000,
               "name":"ASIC Mining",
               "varDiff": {
                "minDiff": 1,
                "targetTime": 5,
                "retargetTime": 30,
                "variancePercent": 50,
                "maxDelta":"1"
             }
            }
         },
         "daemons":[
            {
               "host":"127.0.0.1",
               "port":8889,
               "user":"userhere",
               "password":"passhere"
            }
         ],
         "paymentProcessing":{
            "enabled":true,
            "minimumPayment":1000,
            "payoutScheme":"PPLNS",
            "payoutSchemeConfig":{
               "factor":2.0
            },
            "walletPassword":"1234"
         }
      },
      {
       "id":"pexacoin-mainnet",
       "enabled":false,
       "coin":"pexacoin",
       "address":"XFLSbuasSWhgWRUBLxtANzLT4HYeK5zk4h",
       "rewardRecipients":[
          {
             "address":"XPpAPwQSmTJN5p3mLt8ChPqxh482MjbcBe",
             "percentage":0.9
          }
       ],
       "blockRefreshInterval":500,
       "jobRebroadcastTimeout":55,
       "clientConnectionTimeout":600,
       "banning":{
          "enabled":true,
          "time":600,
          "invalidPercent":50,
          "checkThreshold":50
       },
       "ports":{
          "6832":{
             "listenAddress": "0.0.0.0",
             "difficulty":5,
             "name":"GPU Mining",
             "varDiff": {
                "minDiff": 5,
                "targetTime": 5,
                "retargetTime": 30,
                "variancePercent": 50,
                "maxDelta":"1"
            }
          }
       },
       "daemons":[
          {
             "host":"127.0.0.1",
             "port":8769,
             "user":"userhere",
             "password":"passhere"
          }
       ],
       "paymentProcessing":{
          "enabled":true,
          "minimumPayment":1,
          "payoutScheme":"PPLNS",
          "payoutSchemeConfig":{
             "factor":2.0
          }
       }
       },
       {
          "id":"digibyte-mainnet",
          "enabled":false,
          "coin":"digibyte-sha256",
          "address":"DECqq24gwfA3VMyVZc3aN1yQdxGRhuqyBE",
          "rewardRecipients":[
             {
                "address":"ShT5H8qBGdX6umEAAfLWMAUn5c1YhdzCxa",
                "percentage":1.6
             }
          ],
          "GBTArgs":[
             {"rules":["segwit"]},
             "sha256d"
          ],
          "blockRefreshInterval":500,
          "jobRebroadcastTimeout":55,
          "clientConnectionTimeout":600,
          "banning":{
             "enabled":true,
             "time":600,
             "invalidPercent":50,
             "checkThreshold":50
          },
          "ports":{
             "5373":{
                "listenAddress": "0.0.0.0",
                "difficulty":25000,
                "name":"ASIC Mining",
                "varDiff": {
                   "minDiff": 25000,
                   "targetTime": 5,
                   "retargetTime": 30,
                   "variancePercent": 50,
                   "maxDelta":"1"
               }
             }
          },
          "daemons":[
             {
                "host":"127.0.0.1",
                "port":14022,
                "user":"userhere",
                "password":"passhere"
             }
          ],
          "paymentProcessing":{
             "enabled":true,
             "minimumPayment":1,
             "payoutScheme":"PPLNS",
             "payoutSchemeConfig":{
                "factor":2.0
             }
          }
       },
      {
       "id":"pigeoncoin-testnet",
       "enabled":true,
       "coin":"pigeoncoin-testnet",
       "address":"n84278RnZxxHwmXMYNR77ZaBc19ooH21xQ",
       "rewardRecipients":[
          {
             "address":"nMGZ8TQu8TBFGUSTeXxz7LxiS45nSptm3v",
             "percentage":1
          }
       ],
       "blockRefreshInterval":500,
       "jobRebroadcastTimeout":55,
       "clientConnectionTimeout":600,
       "banning":{
          "enabled":true,
          "time":600,
          "invalidPercent":50,
          "checkThreshold":50
       },
       "ports":{
          "7000":{
             "listenAddress": "0.0.0.0",
             "difficulty":0.1,
             "name":"GPU Mining",
             "varDiff": {
                "minDiff": 0.1,
                "targetTime": 5,
                "retargetTime": 30,
                "variancePercent": 50,
                "maxDelta":"1"
            }
          }
       },
       "daemons":[
          {
             "host":"127.0.0.1",
             "port":19998,
             "user":"userhere",
             "password":"passhere"
          }
       ],
       "paymentProcessing":{
          "enabled":true,
          "minimumPayment":1000,
          "payoutScheme":"PPLNS",
          "payoutSchemeConfig":{
             "factor":2.0
          }
       }
    },
    {
       "id":"sugarchain-testnet",
       "enabled":false,
       "coin":"sugarchain-testnet",
       "address":"tugar1q58sadszum9gmnrv6hghhlvulpeh3yuw6vd6kx6",
       "addressType": "BechSegwit",
       "bechPrefix":"tugar",
       "rewardRecipients":[
          {
             "address":"tugar1qfd8stszqqd4w55h9w0nx5t82n4mrx8u9rmcz8j",
             "percentage":1
          }
       ],
       "blockRefreshInterval":500,
       "jobRebroadcastTimeout":55,
       "clientConnectionTimeout":600,
       "banning":{
          "enabled":true,
          "time":600,
          "invalidPercent":50,
          "checkThreshold":50
       },
       "ports":{
          "9000":{
             "listenAddress": "0.0.0.0",
             "difficulty":0.001,
             "name":"CPU Mining",
             "varDiff": {
                "minDiff": 0.001,
                "targetTime": 5,
                "retargetTime": 30,
                "variancePercent": 50,
                "maxDelta":"1"
            }
          }
       },
       "daemons":[
          {
             "host":"127.0.0.1",
             "port":44229,
             "user":"userhere",
             "password":"passhere"
          }
       ],
       "paymentProcessing":{
          "enabled":true,
          "minimumPayment":1,
          "payoutScheme":"PPLNS",
          "payoutSchemeConfig":{
             "factor":2.0
          }
       }
    }
    ]
 }
 EOF