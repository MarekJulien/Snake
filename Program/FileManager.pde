
class FileManager {

    public int getHighScore() {
        // Open the file from the createWriter() example
        BufferedReader reader = createReader("data.txt");
        String line = null;
        int highScore = 0;
        try {
            if (reader == null) {
                // Create data file
                PrintWriter output = createWriter("data.txt");
                output.println("0");
                output.flush();
                output.close();
            } else {
                line = reader.readLine();
                reader.close();
                highScore = int(line);
            }
        }
        catch (IOException e) {
            e.printStackTrace();
        }

        return highScore;
    }

    public void saveHighScore(int highScore) {
        String[] s = new String[1];
        s[0] = "" + highScore;
        saveStrings("data.txt", s);
    }
}
