\documentclass{beamer}
\usepackage{graphicx} % Required for inserting images
\usetheme {Goettingen}
\usecolortheme{seahorse}


\title{Analisi della copertura glaciale nella catena Hymaliana nel 2022 e nel 2023}
\subtitle{Progetto di Telerilevamento Geo-ecologico 2023}
\author{Giulia Panelli }
\date{15/09/2023}

\begin{document}

\maketitle

\section{Introduzione}

\begin{frame}{Introduzione}
Il progetto in esame si basa sullo studio e l'analisi della catena Hymaliana. \\
La catena Hymaliana è un orogene derivante dalla collisone continentale tra la placca indiana e quella euroasiatica. Geograficamente localizzata nell'Asia del Sud.
\end{frame}

\begin{frame}{Obiettivi principali}
Gli obiettivi principali di questo progetto sono: \\
\begin{itemize}
    \item analisi immagine 2022
    \item analisi immagine 2023
    \item percentuale copertura glaciale nel 2022
    \item percentuale copertura glaciale nel 2023
    \item confronto dei risultati in due periodi diversi
\end{itemize}   
\end{frame}

\section{Metodi}

\begin{frame}{Metodi}
I metodi utilizzati sono:
\begin{itemize}
    \item dowloand delle immagini satellitari da Sentinel 2
    \item visuallizzazione delle immagini in colori naturali
    \item classificazione per l'immagine 2022: substrato e copertura glaciale
    \item classificazione per l'immagine 2023: substrato e copertura glaciale
    \item percentuale delle due classi nel 2022
    \item percentuale delle due classi nel 2023
    \item grafici di confronto delle percentuali nelle diverse annate
    
\end{itemize}
\end{frame}    

\section{Analisi}

\subsection{IMMAGINE 2022}

\begin{frame}{Analisi dell'immagine satellitare del 2022}

\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{Hy22_.jpg}
    \caption{immagine satellitare del 2022}
    
\end{figure}

\end{frame}   

\begin{frame}{Classificazione}

La classificazione è stata eseguita in tre passaggi:

\begin{itemize}
    \item si sono presi tutti i valori singoli dell'immagine
    \item si sono raggruppati i valori in classi
    \item ogni classe è stata individuata per un colore diverso
\end{itemize}

\end{frame}

\begin{frame}{Primo passaggio}

\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{1 passaggio.png}
    
\end{figure}

\end{frame}  

\begin{frame}{Secondo passaggio}

\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{2 pass.png}
    
\end{figure}

\end{frame}  

\begin{frame}{Terzo passaggio}

\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{newclasa.png}
    
\end{figure}

\end{frame} 

\begin{frame}
    
\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{hy22_classi.jpg}
      \caption{Classe 1: grey-substrate; Classe 2: blue-glacier}
    
\end{figure}

\end{frame}


\subsection{IMAGGINE 2023}

\begin{frame}{Analisi dell'immagine satellitare del 2023}

\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{hy23_.jpg}
    \caption{immagine satellitare del 2023}
    
\end{figure}

\end{frame}   

\begin{frame}{Classificazione}
La classificazione è stata eseguita nello stesso modo con cui si è lavorato per l'analisi dell'immagine del 2023
\end{frame}

\begin{frame}{3 passaggi}

\begin{figure}
    \centering
    \includegraphics[width=0.7\textwidth]{passaggi_2023.png}
\end{figure}

\end{frame}  


\begin{frame}
    
\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{hy_23_classi.jpg}
      \caption{Classe 1: grey-substrate; Classe 2: blue-glacier}
\end{figure}

\end{frame}

\section{Risultati}

\begin{frame}{Frequenze e percentuali 2022 }
    
\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{freq_percent.png} 
    
\end{figure}
\end{frame}

\begin{frame}{Frequenze e percentuali 2023 }
    
\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{freq_perc_2023.png}
    
\end{figure}
\end{frame}
\begin{frame}{Tabella delle percentuali}
    
\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{tabella 1.png}
    \caption{2022}
    \label{fig8}
     \includegraphics[width=\textwidth]{tabella2.png}
    \caption{2023}
\end{figure}
\end{frame}

\begin{frame}{Codice per la creazione di grafici}

\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{grafici1.png}
   
\end{figure}

\end{frame}

\begin{frame}{Codice per plottaggio grafici}

\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{grafici2.png}
   
\end{figure}
\end{frame}

\begin{frame}{Risultati in grafici}

\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{grafico_2022.jpg}
    
\end{figure}
\end{frame}
\begin{frame}
    
\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{grafico_2023.jpg}
   
\end{figure}
\end{frame}
\section{Conclusioni}
\begin{frame}{Conclusioni}

I risultati ottenuti mostrano chiaramente che oggi, nel 2023, la catena Hymaliana è caratterizzata da una copertura glaciale maggiore rispetto che nel 2022. I ghiacciai riscoprono il substrato per un 20 \% in più ripetto che nel 2022.
    
\end{frame}

\section{Bibliografia}
\begin{frame}{Bibliografia}
\begin{itemize}
    \item Copernicus: https://scihub.copernicus.eu/
\end{itemize}
    
\end{frame}

\end{document}

