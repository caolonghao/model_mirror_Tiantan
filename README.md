# Tiantan Model Mirror

这个仓库用于保存拆分后的模型文件，以便在内网环境下通过 GitHub 拉取并恢复原始模型。

## 模型拆分说明

为了绕过 GitHub 的文件大小限制（100MB），所有的 `.model` 文件已被拆分为 90MB 的小块，文件名为 `*.model.part.aa`, `*.model.part.ab` 等。

## 如何恢复原始模型

在你拉取（pull）或克隆（clone）本仓库到目标机器后，请按照以下步骤恢复模型：

1. **赋予脚本执行权限**（如果还没有的话）：
   ```bash
   chmod +x restore.sh
   ```

2. **运行恢复脚本**：
   ```bash
   ./restore.sh
   ```

脚本会自动查找所有分块文件并合并为原始的 `.model` 文件。

## 注意事项

- 原始的 `.model` 文件和 `.model.pkl` 文件已被加入 `.gitignore`，以防再次提交大文件。
- 如果你需要拆分新模型，可以使用 `split.sh` 脚本。
