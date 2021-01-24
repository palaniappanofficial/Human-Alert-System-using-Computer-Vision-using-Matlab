clc;clear;
close all;
camObj = webcam();

% Preview a stream of image frames.
faceDetector = vision.CascadeObjectDetector('FrontalFaceCART');
preview(camObj);
while(1)
    img = snapshot(camObj);
    bboxes = step(faceDetector, img); % Detect faces
    % Annotate detected faces
    if isempty(bboxes)
        continue
    else
        IFaces = insertObjectAnnotation(img, 'rectangle', bboxes, 'Face');
        imshow(IFaces)
        aUserInput=char('Human Detected');
        NET.addAssembly('System.Speech');
        obj=System.Speech.Synthesis.SpeechSynthesizer;
        Speak(obj,aUserInput);
        pause(1);
        break
    end
end