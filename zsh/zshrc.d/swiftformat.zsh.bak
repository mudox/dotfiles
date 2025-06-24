gsf() {
  local localbin='Pods/SwiftFormat/CommandLineTool/swiftformat'
  if [[ -f "$localbin" ]]; then
    local bin="${localbin}"
  else
    local bin='swiftformat'
  fi

  echo "using ${bin}"

  "${bin}" .                                                                                                                                         \
    --exclude Carthage,DerivedData,Example,Pods,R.generated.swift,R.temp.swift                                                                       \
    --disable redundantSelf,blankLinesAroundMark,blankLinesAtStartOfScope,wrapMultilineStatementBraces,initCoderUnavailable,enumNamespaces,typeSugar \
    --swiftversion 5.2                                                                                                                               \
    --stripunusedargs closure-only                                                                                                                   \
    --nospaceoperators '...,..<'                                                                                                                     \
    --wraparguments before-first                                                                                                                     \
    --wrapcollections before-first                                                                                                                   \
}
