/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package server.controller;

import java.io.IOException;
import server.RunServer;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import server.db.layers.BUS.GameMatchBUS;
import server.db.layers.BUS.PlayerBUS;
import server.db.layers.DTO.GameMatch;
import server.db.layers.DTO.Player;


public class Admin implements Runnable {

    GameMatchBUS gameMatchBus;
    PlayerBUS playerBus;

    @Override
    public void run() {
        Scanner s = new Scanner(System.in);
        String inp;

        while (!RunServer.isShutDown) {
            System.out.print("AdminCommand> ");
            inp = s.nextLine();
            try {
                if (inp.equalsIgnoreCase("online-count")) {
                    System.out.println("> " + RunServer.clientManager.getSize());
                } else if (inp.equalsIgnoreCase("user-count")) {
                    showUserCount();
                } else if (inp.equalsIgnoreCase("best-user")) {
                    showBestPlayerInfo(getBestUser());
                } else if (inp.equalsIgnoreCase("shortest-match")) {
                    showShortestMatch(getShortestMatch());
                } else if (inp.indexOf("block") == 0) {
                    System.out.println(blockUser(inp.split(" ")[1]));
                } else if (inp.indexOf("log") == 0) {
                    showGameMatchDetails(inp.split(" ")[1]);
                } else if (inp.equalsIgnoreCase("room-count")) {
                    System.out.println("> " + RunServer.roomManager.getSize());
                } else if (inp.equalsIgnoreCase("shutdown")) {
                    System.out.println("shuting down...");
                    RunServer.isShutDown = true;

                    try {
                        RunServer.ss.close();
                    } catch (IOException ex) {
                        Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }catch(ArrayIndexOutOfBoundsException e){
                System.out.println("Thi???u tham s??? !!!");
            }

            if (inp.equalsIgnoreCase("help")) {
                System.out.println("===[List commands]======================\n"
                        + "======= Thi???t y???u =======\n"
                        + "online-count:      s??? ng?????i ??ang online\n"
                        + "user-count:        t???ng s??? user\n"
                        + "best-user:         th??ng tin user th???ng nhi???u nh???t\n"
                        + "shortest-match:    th??ng tin tr???n ?????u c?? th???i gian ng???n nh???t\n"
                        + "block <user-emal>: block user c?? email l?? <user-email kh???i h??? th???ng>\n"
                        + "log <match-id>:    xem th??ng tin tr???n ?????u c?? m?? l?? <match-id>\n"
                        + "======= Th??m =======\n"
                        + "room-count: s??? ph??ng ??ang m???\n"
                        + "shutdown: t???t server\n"
                        + "=======================================");
            }
        }
    }

    // Get player with the most win count
    private Player getBestUser() {
        Player bestPlayer = null;
        playerBus = new PlayerBUS();
        int max = 0;
        for (Player p : playerBus.getList()) {
            if (p.getWinCount() > max) {
                max = p.getWinCount();
                bestPlayer = new Player(p);
            }
        }
        return bestPlayer;
    }

    private void showBestPlayerInfo(Player p) {
        System.out.println("Player with the most win count: "
                + p.getName() + " - " + p.getEmail());
        System.out.println("Score: " + p.getScore());
        System.out.println("Win count: " + p.getWinCount());
    }
    
    private int getUserCount(){
        int count =0;
        playerBus = new PlayerBUS();
        int max = 0;
        for (Player p : playerBus.getList()) {
            count += 1;
        }
        return count;
    }
    
    private void showUserCount() {
        System.out.println("Number of user: " + getUserCount());
    }

    // Get the match with the shortest play time
    public GameMatch getShortestMatch() {
        gameMatchBus = new GameMatchBUS();
        GameMatch shortestMatch = null;
        int min = gameMatchBus.getList().get(0).getTotalMove();
        for (GameMatch m : gameMatchBus.getList()) {
            if (m.getPlayTime() < min) {
                min = m.getPlayTime();
                shortestMatch = new GameMatch(m);
            }
        }
        return shortestMatch;
    }

    private void showShortestMatch(GameMatch m) {
        playerBus = new PlayerBUS();
        Player p1 = new Player(playerBus.getById(m.getPlayerID1()));
        Player p2 = new Player(playerBus.getById(m.getPlayerID2()));
        System.out.println("The match with shortest play time: ");
        System.out.println("Player 1: " + p1.getName());
        System.out.println("Player 1: " + p2.getName());
        System.out.println("Play time: " + m.getPlayTime() + " second");
    }

    // Block user with provided email
    private String blockUser(String email) {
        playerBus = new PlayerBUS();
        for (Player p : playerBus.getList()) {
            if (p.getEmail().equalsIgnoreCase(email)) {
                p.setBlocked(true);
                return playerBus.update(p) ? "Success" : "Fail";
            }
        }
        return "Cant find user with provided email!";
    }

    // Get Game match with provide id
    private void showGameMatchDetails(String id) {
        gameMatchBus = new GameMatchBUS();
        playerBus = new PlayerBUS();
        GameMatch m = gameMatchBus.getById(Integer.parseInt(id));
        System.out.println("Match id: " + m.getId());
        System.out.println("    + Player 1: " + playerBus.getById(m.getPlayerID1()).getName());
        System.out.println("    + Player 2: " + playerBus.getById(m.getPlayerID2()).getName());
        System.out.println("    + Winner: " + playerBus.getById(m.getWinnerID()).getName());
        System.out.println("    + Play time in second: " + m.getPlayTime());
        System.out.println("    + Total move: " + m.getTotalMove());
    }

    public static void main(String[] args) {
        Admin ad = new Admin();
        ad.run();
    }
}
