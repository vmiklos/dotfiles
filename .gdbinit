add-auto-load-safe-path /home/vmiklos
set history filename ~/.gdb_history
set history save on
alias ndump = print SwDoc::s_pLast->dumpAsXml(0)
alias ldump = print SwRootFrame::s_pLast->dumpAsXml(0)
alias mdump = print SdDrawDocument::s_pLast->dumpAsXml(0)
