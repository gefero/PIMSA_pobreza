    library(wbstats)
    library(tidyverse)
    
    indicators <- c('SH.TBS.INCD',
    'SP.DYN.LE00.IN',
    'SH.DYN.AIDS.ZS',
    'SH.DTH.COMM.ZS',
    'SH.SGR.PROC.P5',
    'SH.XPD.OOPC.CH.ZS',
    'SH.UHC.NOP1.ZS',
    'SH.UHC.NOP2.ZS',
    'SH.UHC.OOPC.10.ZS',
    'SH.UHC.OOPC.25.ZS',
    'SH.SGR.CRSK.ZS',
    'SH.SGR.IRSK.ZS',
    'SP.DYN.TO65.FE.ZS',
    'SP.DYN.TO65.MA.ZS',
    'SP.UWT.TFRT',
    'SG.DMK.SRCR.FN.ZS',
    'SG.DMK.ALLD.FN.ZS',
    'SG.VAW.REAS.ZS',
    'SH.IMM.IDPT',
    'SH.IMM.HEPB',
    'SH.IMM.MEAS',
    'SH.VAC.TTNS.ZS',
    'SH.DYN.MORT',
    'SP.DYN.IMRT.IN',
    'SH.STA.MMRT',
    'SH.STA.ANVC.ZS',
    'SP.ADO.TFRT',
    'SH.STA.BRTC.ZS',
    'SP.DYN.CONU.ZS',
    'SP.DYN.CONM.ZS',
    'SP.DYN.TFRT.IN',
    'SP.MTR.1519.ZS',
    'SP.M15.2024.FE.ZS',
    'SP.M18.2024.FE.ZS',
    'SH.STA.POIS.P5',
    'SH.STA.AIRP.P5',
    'SH.STA.WASH.P5',
    'SP.POP.DPND',
    'SP.POP.DPND.OL',
    'SP.POP.DPND.YG',
    'SH.STA.BRTC.ZS',
    'SH.DYN.0514',
    'SE.ADT.LITR.ZS',
    'SE.TER.CUAT.DO.ZS',
    'SE.TER.CUAT.BA.ZS',
    'SE.TER.CUAT.MS.ZS',
    'SE.SEC.CUAT.LO.ZS',
    'SE.SEC.CUAT.PO.ZS',
    'SE.PRM.CUAT.ZS',
    'SE.TER.CUAT.ST.ZS',
    'SE.SEC.CUAT.UP.ZS',
    'SL.TLF.ADVN.ZS',
    'SL.TLF.BASC.ZS',
    'SL.TLF.INTM.ZS',
    'SE.COM.DURS',
    'SE.ADT.1524.LT.ZS',
    'SE.PRE.ENRR',
    'SE.PRM.ENRR',
    'SE.PRM.NENR',
    'SE.PRM.TENR',
    'SE.PRM.CMPT.ZS',
    'SE.PRM.GINT.ZS',
    'SE.PRM.NINT.ZS',
    'SE.PRM.OENR.ZS',
    'SE.PRM.REPT.ZS',
    'SE.PRM.PRS5.ZS',
    'SE.PRM.PRSL.ZS',
    'SE.PRM.UNER.ZS',
    'SE.SEC.PROG.ZS',
    'SE.SEC.ENRR',
    'SE.SEC.NENR',
    'SE.SEC.CMPT.LO.ZS',
    'SE.SEC.UNER.LO.ZS',
    'SE.TER.ENRR',
    'SL.TLF.0714.ZS',
    'SL.TLF.0714.WK.ZS',
    'SL.TLF.0714.SW.ZS',
    'SL.TLF.0714.WK.TM',
    'SL.UEM.NEET.ZS',
    'EG.ELC.ACCS.ZS',
    'EG.ELC.ACCS.RU.ZS',
    'EG.ELC.ACCS.UR.ZS',
    'EN.POP.SLUM.UR.ZS',
    'EN.CLC.MDAT.ZS',
    'EG.CFT.ACCS.ZS',
    'SH.STA.ODFC.RU.ZS',
    'SH.STA.ODFC.UR.ZS',
    'SH.H2O.BASW.ZS',
    'SH.H2O.BASW.RU.ZS',
    'SH.H2O.BASW.UR.ZS',
    'SH.STA.BASS.ZS',
    'SH.STA.BASS.RU.ZS',
    'SH.STA.BASS.UR.ZS',
    'SH.H2O.SMDW.ZS',
    'SH.H2O.SMDW.RU.ZS',
    'SH.H2O.SMDW.UR.ZS',
    'SH.STA.SMSS.ZS',
    'SH.STA.SMSS.RU.ZS',
    'SH.STA.SMSS.UR.ZS',
    'SH.STA.HYGN.ZS',
    'SH.STA.HYGN.RU.ZS',
    'SH.STA.HYGN.UR.ZS',
    'SH.STA.MALN.ZS',
    'SH.STA.STNT.ZS',
    'SH.ANM.CHLD.ZS',
    'SH.STA.OWGH.ZS',
    'SH.SVR.WAST.ZS',
    'SN.ITK.DEFC.ZS',
    'IT.NET.BBND.P2',
    'IT.MLT.MAIN.P2',
    'IT.CEL.SETS.P2',
    'IT.NET.SECR.P6',
    'IT.NET.USER.ZS',
    'FB.ATM.TOTL.P5',
    'FB.CBK.BRCH.P5',
    'FB.CBK.BRWR.P3',
    'FB.CBK.DPTR.P3',
    'IC.CRD.PRVT.ZS',
    'IC.CRD.PUBL.ZS',
    'SI.SPR.PC40',
    'SI.SPR.PCAP',
    'NE.CON.PRVT.PC.KD',
    'SI.DST.FRST.10',
    'SI.DST.FRST.20',
    'SI.DST.02ND.20',
    'SI.DST.03RD.20',
    'SI.POV.DDAY',
    'SI.POV.LMIC',
    'SI.POV.UMIC',
    'SI.POV.NAHC',
    'SI.POV.RUHC',
    'SI.POV.URHC',
    'PER_SI_ALLSI.ADQ_POP_TOT',
    'PER_ALLSP.ADQ_POP_TOT',
    'PER_SA_ALLSA.ADQ_POP_TOT',
    'PER_LM_ALLLM.ADQ_POP_TOT',
    'PER_LM_ALLLM.BEN_Q1_TOT',
    'PER_SI_ALLSI.COV_POP_TOT',
    'PER_SI_ALLSI.COV_Q1_TOT',
    'PER_SI_ALLSI.COV_Q2_TOT',
    'PER_SI_ALLSI.COV_Q3_TOT',
    'PER_ALLSP.COV_POP_TOT',
    'PER_SA_ALLSA.COV_POP_TOT',
    'PER_SA_ALLSA.COV_Q1_TOT',
    'PER_SA_ALLSA.COV_Q2_TOT',
    'PER_SA_ALLSA.COV_Q3_TOT',
    'PER_LM_ALLLM.COV_Q1_TOT',
    'PER_LM_ALLLM.COV_Q2_TOT',
    'PER_LM_ALLLM.COV_Q3_TOT')
    
pobreza <- tibble()
    c <- 0
    t0 <- proc.time()
    for (i in indicators){
        c <- c + 1
        try({
            ind <-wb(indicator=i, country='countries_only')
            pobreza <- pobreza %>%
                bind_rows(ind)
            })
        
        if (c %% 10){
            write_csv(pobreza, './data/indicadores_pais/pobreza_estructural_final.csv')
        }
        print(paste0(c, ' indicatores dowloaded...'))
    }
    write_csv(pobreza, './data/indicadores_pais/pobreza_estructural_final.csv')
    proc.time() - t0


x <- pobreza %>%
    filter(date >= 2005 & date <= 2015) %>%
    group_by(country, indicator, indicatorID) %>%
    summarise(ymin = min(date),
              ymax = max(date),
              n = n()) %>%
    arrange(indicator, country, n) %>%
    ungroup()

x %>%
    filter(n == 11) %>%
    select(indicator) %>%
    unique()
    

xx <- pobreza %>%
    filter(date >= 2005 & date <= 2015) %>%
    group_by(country) %>%
    summarise(n = n()) %>%
    arrange(country, n) %>%
    ungroup()

    
    
p <- read_csv('./data/indicadores_pais/pobreza_estructural_final.csv')
ind_out <- indicators[!(indicators %in% unique(p$indicatorID))]

    pobreza_ <- tibble()
    c <- 0
    t0 <- proc.time()
    for (i in ind_out){
        try({
            ind_ <-wb(indicator=i, country='countries_only')
            pobreza_ <- pobreza_ %>%
                bind_rows(ind_)
        })
        
        if (c %% 10){
            write_csv(pobreza_, './data/indicadores_pais/pobreza_estructural_indicadores_extra.csv')
            print(paste0(c, ' indicatores saved...'))
        }
    }
    write_csv(pobreza_, './data/indicadores_pais/pobreza_estructural_indicadores_extra.csv')
    proc.time() - t0

        