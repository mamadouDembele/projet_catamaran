import numpy as np
from math import sin, cos, pi, log
import matplotlib.pyplot as plt
import time




class Simulateur():

    def __init__(self):
        self.init_state()
        self.dt = 0.01
        self.lxm = 45 # latitude de référence en degrés
        self.lym = -3 # longitude de référence en degrés
        self.rho = 6371000 # diametre de la terre
        # self.simulate_dyn = self.simulate_dyn_1
        # self.simulate_dyn = self.make_dyn(1.08, 40.67, 41.08, *self.param_d(1.08, 40.67, 41.08, 5, 2, 5))
        self.simulate_dyn = self.make_dyn_carre(60, 60, 30, 0.09*1000*0.25*0.25*1/2, 1.05*1000*2.5*0.25*1/2, 1.05*1000*2.5*0.25*1/2)
        self.simulate_mesures = self.simulate_mesures_1
        self.init_log()
        plt.figure()
        self.axlim = 300
        self.simulate_mesures()
        # plt.xlim(-100, 100)
        # plt.ylim(-100, 100)
        # plt.show()
        # self.real_t = 0



    def init_state(self):
        self.x = 0
        self.y = 0
        self.psi = 270*pi/180
        self.u = 0
        self.v = 0
        self.r = 0
        self.t = 0

    def param_d(self, m11, m22, m33, tx, ty, tr):
        d11 = -m11*log(0.5)/tx
        d22 = -m22*log(0.5)/ty
        d33 = -m33*log(0.5)/tr
        return d11, d22, d33

    def init_log(self):
        s = "{t: >8} {x: >8} {y: >8} {psi: ^5}\n".format(t="temps ", x="lat  ", y="long  ", psi="cap")
        with open("sim_log.txt",'wt') as f:
            f.write(s)

    def write_log(self):
        s = "{: >-8.3f} {: >-8.2f} {: >-8.2f} {: >-5.1f}\n".format(self.t, self.x, self.y, self.psi*180/pi)
        with open("sim_log.txt", 'at') as f:
            f.write(s)

    def euler(self, x_dot, y_dot, psi_dot, u_dot, v_dot, r_dot):
        self.x += self.dt * x_dot
        self.y += self.dt * y_dot
        self.psi += self.dt * psi_dot
        self.u += self.dt * u_dot
        self.v += self.dt * v_dot
        self.r += self.dt * r_dot

    def moteur(self, p, theta):
        "transforme les commandes moteurs en poussés"
        return p*cos(theta), p*sin(theta)

    def make_dyn(self, m11, m22, m33, d11, d22, d33):
        c1 = m22 / m11
        c2 = - d11 / m11
        c3 = 1 / m11
        c4 = - m11 / m22
        c5 = - d22 / m22
        c6 = (m11 - m22) / m33
        c7 = - d33 / m33
        c8 = 1 / m33
        engine_dist = 1

        def dyn(w1, w2, theta1, theta2):
            tu1, tv1 = self.moteur(w1, theta1)
            tu2, tv2 = self.moteur(w2, theta2)

            x_dot = cos(self.psi)*self.u - sin(self.psi)*self.v
            y_dot = sin(self.psi)*self.u + cos(self.psi)*self.v
            psi_dot = self.r
            u_dot = c1*self.v*self.r + c2*self.u + c3*(tu1 + tu2)
            v_dot = c4*self.v*self.r + c5*self.v + c3*(tv1 + tv2)
            r_dot = c6*self.u*self.v + c7*self.r + c8*(tu1 - tu2)/(2*engine_dist)
            self.euler(x_dot, y_dot, psi_dot, u_dot, v_dot, r_dot)
            # return x_dot, y_dot, psi_dot, u_dot, v_dot, r_dot

        return dyn

    def make_dyn_carre(self, m11, m22, m33, d11, d22, d33):
        c1 = m22 / m11
        c2 = - d11 / m11
        c3 = 1 / m11
        c4 = - m11 / m22
        c5 = - d22 / m22
        c6 = (m11 - m22) / m33
        c7 = - d33 / m33
        c8 = 1 / m33
        engine_dist = 1

        def dyn(w1, w2, theta1, theta2):
            tu1, tv1 = self.moteur(w1, theta1)
            tu2, tv2 = self.moteur(w2, theta2)

            x_dot = cos(self.psi)*self.u - sin(self.psi)*self.v
            y_dot = sin(self.psi)*self.u + cos(self.psi)*self.v
            psi_dot = self.r
            u_dot = c1*self.v*self.r + c2*self.u + c3*(tu1 + tu2)
            v_dot = c4*self.v*self.r + c5*self.v + c3*(tv1 + tv2)
            r_dot = c6*self.u*self.v + c7*self.r*abs(self.r) + c8*(tu1 - tu2)/(2*engine_dist)
            self.euler(x_dot, y_dot, psi_dot, u_dot, v_dot, r_dot)
            # return x_dot, y_dot, psi_dot, u_dot, v_dot, r_dot

        return dyn

    def simulate_dyn_1(self, w1, w2, theta1, theta2):
        x_dot = cos(self.psi) * self.u
        y_dot = sin(self.psi) * self.u
        psi_dot = self.r
        self.x += self.dt*(cos(self.psi) * self.u)
        self.y += self.dt*(sin(self.psi) * self.u)
        self.psi += self.dt * self.r
        self.u += self.dt * (p * cos(theta) - self.u)
        self.v = 0
        self.r += self.dt * (p * sin(theta) - self.r)

    def simulate_mesures_1(self):
        self.x_til = self.x
        self.y_til = self.y
        self.psi_til = self.psi
        self.t_til = self.t


    def simulate(self, w1, w2, theta1, theta2, t):
        if t < self.t:
            raise Exception("'t < self.t' : Time must be greater than it was during last call.")
        temps_passe = t - self.t
        while self.t < t - self.dt:
            self.t += self.dt
            self.simulate_dyn(w1, w2, theta1, theta2)
            self.simulate_mesures()
        self.write_log()
        self.draw()

    def rot_trans(self):
        theta = pi/2 - self.psi
        dx = self.y
        dy = self.x
        R = np.array([
            [cos(theta), -sin(theta), dx],
            [sin(theta), cos(theta), dy],
            [0, 0, 1]
        ])
        return R

    def draw(self):
        L = 5
        l = 2
        M = 4*np.array([[-L / 2, L / 4, L / 2, L / 4, -L / 2, -L / 2, -L / 8, -L / 8, L / 8, L / 8, -L / 8, -L / 8, -L / 8,
                    L / 4, L / 2, L / 4, -L / 2, -L / 2, L / 4],
                   [L / 4, L / 4, L / 4 + l / 2, L / 4 + l, L / 4 + l, L / 4, L / 4, L / 4 + l, L / 4 + l, -L / 4 - l,
                    -L / 4 - l, L / 4, -L / 4, -L / 4, -L / 4 - l / 2, -L / 4 - l, -L / 4 - l, -L / 4, -L / 4]])
        M = np.vstack((M, np.ones(len(M[0]))))

        # print(M)
        Mt = self.rot_trans() @ M
        plt.cla()
        plt.xlim(-self.axlim, self.axlim)
        plt.ylim(-self.axlim, self.axlim)
        plt.plot(Mt[0,:], Mt[1,:], color = 'b')
        plt.pause(0.001)

        # plt.plot(M[0, :], M[1, :])


    def get_pos(self):
        return self.t_til, self.x_til, self.y_til

    def get_compas(self):
        return self.psi_til

    def get_gps(self):
        """
        Gives the coordinates of the position in degrees
        :return: (lat, long) whith lat, long expressed in degrees
        """
        lx = self.lxm + (self.x_til/self.rho) * (180/pi)
        ly = self.lym + (self.y_til/(self.rho*cos(self.lxm*pi/180))) * 180/pi
        return self. t_til, lx, ly

if __name__ == "__main__":
    sim = Simulateur()
    sim.draw()
    plt.show()


