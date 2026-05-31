import { useEffect, useState } from 'react';
import { Howl } from 'howler';

interface JobAnnouncementData {
  job: string;
  message: string;
  image: string;
  sound: string;
  volume?: number;
  duration?: number;
  borderColor?: string;
  backgroundColor?: string;
  titleColor?: string;
  messageColor?: string;
}

function App() {
  const [announcement, setAnnouncement] = useState<JobAnnouncementData | null>(null);
  const [isVisible, setIsVisible] = useState(false);
  const [isExiting, setIsExiting] = useState(false);
  const [timestamp, setTimestamp] = useState('');

  useEffect(() => {
    let timeoutId: ReturnType<typeof setTimeout>;
    let exitTimeoutId: ReturnType<typeof setTimeout>;

    const handleMessage = (event: MessageEvent) => {
      if (event.data.action === 'jobAnnouncement') {
        const data = event.data as JobAnnouncementData;
        
        clearTimeout(timeoutId);
        clearTimeout(exitTimeoutId);
        
        setAnnouncement(data);
        setIsVisible(true);
        setIsExiting(false);
        
        const now = new Date();
        const timeString = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        setTimestamp(timeString);
        
        const audioPlayer = new Howl({ src: ['sounds/' + data.sound] });
        audioPlayer.volume(data.volume !== undefined ? data.volume : 0.4);
        audioPlayer.play();
        
        const duration = data.duration || 10000;
        
        timeoutId = setTimeout(() => {
          setIsExiting(true);
          
          exitTimeoutId = setTimeout(() => {
            setIsVisible(false);
            setAnnouncement(null);
          }, 600);
        }, duration);
      }
    };

    window.addEventListener('message', handleMessage);
    return () => {
      window.removeEventListener('message', handleMessage);
      clearTimeout(timeoutId);
      clearTimeout(exitTimeoutId);
    };
  }, []);

  if (!isVisible || !announcement) return null;

  const animationClass = isExiting ? 'exit' : 'enter';

  const customStyles = {
    '--border-color': announcement.borderColor || '#00f0ff',
    '--bg-color': announcement.backgroundColor || '#0a0f19',
    '--title-color': announcement.titleColor || '#00f0ff',
    '--message-color': announcement.messageColor || '#ffffff',
  } as React.CSSProperties;

  return (
    <div id="announcementContainer" className={animationClass} style={customStyles}>
      
      <div className="animated-border-wrapper">
        <div className="card-glass">
          <div className="card-content">
            
            <div className="image-wrapper">
               <img id="jobImage" src={announcement.image} alt="Job" />
            </div>
            
            <div className="text-content">
              <div className="header-row">
                <div id="jobTitle">
                  <i className="fa-solid fa-bullhorn title-icon" style={{ color: 'var(--title-color)' }}></i>
                  <span className="title-text">{announcement.job}</span>
                </div>
                <div className="time-badge">
                  <i className="fa-regular fa-clock"></i>
                  <span>{timestamp}</span>
                </div>
              </div>
              
              <div id="jobMessage">{announcement.message}</div>
            </div>
            
          </div>
        </div>
      </div>

    </div>
  );
}

export default App;
