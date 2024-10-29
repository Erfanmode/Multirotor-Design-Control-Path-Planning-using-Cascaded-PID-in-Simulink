clear
clc
close all
X_start = [0,1];
X_end= [15,0];
obs1 = [2.5,1; 3.5,1; 4,2; 3,3; 2,2; 2.5,1];
obs2 = [5.5,1; 5.5,-1];
obs3 = [8,2.2,1.5];
obs4 = [10.5,1.2; 11.5,3.6; 13.5,3.2; 13.5,1.2; 12.4,2.2; 10.5,1.2];
obs5 = [11.2,0; 12.7,0];
obs6 = [1,-1; 4,-2; 1,-3; 1,-1];
obs7 = [7.5,-3.5; 7.5,-1; 10,-1; 10,-3.5; 7.5,-3.5];
obs8 = [12.7,-2,1.7];
obs9 = [0,2.5; 0,4; 16.5,4; 16.5,-4; 0,-4; 0,-2.5];
obstacles = {obs1,obs2,obs3,obs4,...
    obs5,obs6,obs7,obs8,obs9};
T =30; % in second
etha = 1; alpha = 0.05;
Path_points=Path_generator(X_start, X_end, etha, alpha, obstacles);
sz = size(Path_points,1);
dt = T/sz;
t = 0:dt:T-dt;
x =Path_points(:,1);
y =Path_points(:,2);
z = -13*ones(sz,1);
path_table = cat(2,x,y,z);
f = figure;
f.Position=[400,400,1000,500];
for i=1:length(obstacles)
    if size(obstacles{i},2) == 3 % which means obstacle is circle
        circle(obstacles{i});
    else
        plot(obstacles{i}(:,1),obstacles{i}(:,2));
        hold on
    end
end
plot(Path_points(:,1),Path_points(:,2));
hold on
scatter(X_start(1),X_start(2));
hold on
scatter(X_end(1),X_end(2));
grid on
xlim([-2,18]);
ylim([-5,5]);


function  P = Path_generator (Xs, Xf, eta, alpha, B)
P=[];
position=Xs;
r0=1; % repulsion force effect radius
k=0;
epsilon=0.01;
rep = 50; count = rep;
N=5000; % to set a maximum for iteration even though we don't reach the final point
while norm(position-Xf)>0.1
    k=k+1;
    if k>N
        warning('running time error');
        break
    end
    F_repulsion=[0,0];
    for i=1:length(B)
        if size(B{i},2) == 3 % which means obstacle is circle
            H = B{i}(1:2);
            R = B{i}(3);
            r = norm(position-H) - R;
            if r<r0
                F_repulsion = alpha/r^3*(1/r - 1/r0)*(position-H) + F_repulsion;
            end
            
        else
            for j=1:length(B{i})-1
                p1=B{i}(j,:);
                p2=B{i}(j+1,:);
                D=[(p2-p1)', -[0,-1;1,0]*(p2-p1)'];
                if det(D)~=0
                    ab=D\(position-p1)';
                end
                if ab(1)<0
                    H=p1;
                elseif ab(1)>1
                    H=p2;
                else
                    H=ab(1)*(p2-p1)+p1;
                end
                r=norm(position-H);
                if r<r0
                    F_repulsion = alpha/r^3*(1/r - 1/r0)*(position-H) + F_repulsion;
                end
            end
        end
    end
    
    F_attraction= -eta*(position-Xf);
    signal = abs((norm(F_attraction)-norm(F_repulsion))/norm(F_repulsion))<0.1...
        && dot(F_attraction/norm(F_attraction),F_repulsion/norm(F_repulsion))...
        < -0.90;
    if signal || count<rep
        if count == rep
            count = 0;
        end
        count = count + 1;
        delta = position-Xf;
        if delta(2)>0
            coeff = -1;
        else
            coeff = 1;
        end
        F_total = norm(F_attraction)*(coeff*[0,-1;1,0]*delta'/norm(delta))';
        F_total = F_total + F_repulsion;
    else
        F_total = F_attraction + F_repulsion;
    end
    f = F_total / norm(F_total);
    position = position + f*epsilon;
    P(k,:)=position;
end
end

function circle(obs)
Xc = obs(1);
Yc = obs(2);
R = obs(3);
t= 0:0.01:2*pi;
y = R*sin(t)+Yc ;
x =R*cos(t)+Xc;
plot(x,y);
end
