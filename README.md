# FK harness

FK-san's samples of AI Agent Harness for Claude Code.

## How to install
1. copy `apm.yml` into your project
2. run `apm install`

## SKILLS
### 外部SKILL
- empirical-prompt-tuning: SKILL等のプロンプトのデバッグや高精度化をやるSKILL。
- grilling: 曖昧な要件に対してAIが人間に詰めてくる。旧grill-me。
- skill-creator: Anthropic公式のやつ

### このリポジトリで公開している自作SKILL
- classifying-harness: ハーネスでやりたいことが、CLAUDE.md, SKILLS, Rules, Hooks, etc.のいずれで実現するのが適切かを振り分ける。
- retrospecting-harness: セッション(Chat)の履歴から、CCが人間の意図と異なる挙動を示した箇所を洗い出し、Harnessを改善して再発を防止する案をださせるSKILL。セッションが一段落したら、人間が`/retrospecting-harness`として発動させる。

## 補足
### classifying-harness
Claude Code自身にHarnessの改善をさせるとすぐ「CLAUDE.mdに追記します」と言い出しますが、
CLAUDE.mdの肥大化はBad Practiceなので、SKILL、Rules、Hooksなど適切な場所に振り分けたいと思ってました。
ネットを調査しても、世界の有力なAIDD CoderがそういったSKILLを公開しているわけではなさそうなので、自作しました。


